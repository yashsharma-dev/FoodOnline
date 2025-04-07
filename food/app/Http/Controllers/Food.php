<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class Food extends Controller
{
    public function home()
    {
        // Fetch the initial list of food menu items with the necessary joins
        $result = DB::select("SELECT food_menu.id, food_menu.food_name, food_menu.food_desc, food_menu.food_image, food_menu.alias, main_category.cat_name, state_food.state_name FROM food_menu INNER JOIN main_category ON main_category.id = food_menu.food_main_cat INNER JOIN state_food ON state_food.id = food_menu.food_state_cat");

        // Loop through the results
        foreach ($result as $row) {
            // Get the price list for each food item
            $prices = DB::select("SELECT plate_size, price FROM plate_size_record WHERE food_menu_id = ?", [$row->id]);

            // Update the food image URL
            $row->food_image = asset("storage/" . $row->food_image);

            // Add the price list to the row (store it in a 'prices' field)
            $row->prices = $prices;
        }

        // Return the updated result as a JSON response
        return response()->json($result);
    }


    public function category()
    {
        $result = DB::select("SELECT * FROM `main_category`");

        return response()->json($result);
    }
    public function states()
    {
        $result = DB::select("SELECT * FROM state_food");

        return response()->json($result);
    }

    public function single_product($id)
    {
        $result = DB::select("SELECT food_menu.id, food_menu.food_name, food_menu.food_desc, food_menu.food_image, food_menu.alias, main_category.cat_name, state_food.state_name FROM food_menu INNER JOIN main_category ON main_category.id = food_menu.food_main_cat INNER JOIN state_food ON state_food.id = food_menu.food_state_cat where food_menu.id = " . $id);

        // Loop through the results
        foreach ($result as $row) {
            // Get the price list for each food item
            $prices = DB::select("SELECT plate_size, price FROM plate_size_record WHERE food_menu_id = ?", [$row->id]);

            // Update the food image URL
            $row->food_image = asset("storage/" . $row->food_image);

            // Add the price list to the row (store it in a 'prices' field)
            $row->prices = $prices;
        }

        // Return the updated result as a JSON response
        return response()->json($result[0]);
    }

    public function register(Request $request)
    {
        $email = $request->get("email");

        $username = $request->get("username");

        $role = $request->get("role");

        $Password = $request->get("password");

        if ($role == "admin") {
            $admin_password = $request->get("admin_password");

            if ($admin_password == "james") {
                $token = $this->genrateRandomString(50);

                DB::insert("INSERT INTO `user`( `email`, `password`, `username`, `token`, `role`) VALUES ('" . $email . "','" . $Password . "','" . $username . "','" . $token . "','" . $role . "')");

                $user = [];
                $user['status'] = "OK";
                $user['username'] = $username;
                $user['role'] = $role;
                $user['token'] = $token;

                return response()->json($user);
            } else {
                $user['status'] = "Error";
                $user['msg'] = "* Admin Password Is Incorrect";
                return response()->json($user);
            }
        } else {
            $token = $this->genrateRandomString(50);

            DB::insert("INSERT INTO `user`( `email`, `password`, `username`, `token`, `role`) VALUES ('" . $email . "','" . $Password . "','" . $username . "','" . $token . "','" . $role . "')");

            $user = [];
            $user['status'] = "OK";
            $user['username'] = $username;
            $user['role'] = $role;
            $user['token'] = $token;

            return response()->json($user);
        }
    }




    public function login(Request $request)
    {
        $email = $request->get("email");

        $role = $request->get("role");

        $password = $request->get("password");

        $result = DB::select("Select * from user where email = '" . $email . "' and role = '" . $role . "' and password = '" . $password . "'");

        $count = 0;

        $user_data = "";

        foreach ($result as $row) {
            $count = 1;
            $user_data = $row;
        }

        if ($count == 1) {
            $token = $this->genrateRandomString(50);
            $user = [];
            $user['status'] = "OK";
            $user['username'] = $user_data->username;
            $user['role'] = $role;
            $user['token'] = $token;

            DB::update("update user set token='" . $token . "' where email = '" . $email . "' and password = '" . $password . "'  ");


            return response()->json($user);
        } else {
            $user['status'] = "Error";
            $user['msg'] = "* Admin Password Is Incorrect";
            $user['helo'] = "kuch to gabbag gaui";
            return response()->json($user);
        }
    }

    public function add_product(Request $request)
    {
        if ($request->hasFile("food_image")) {
            $food_image = $request->food_image->getClientOriginalName();
            $request->food_image->move(public_path('storage/images'), $food_image);
        }

        DB::insert("INSERT INTO `food_menu`( `food_name`, `food_main_cat`, `food_state_cat`, `food_desc`, `food_image`, `is_delete`, `alias`) VALUES (
        '" . $request->get("food_name") . "',
        " . $request->get("food_main_cat") . ",
        " . $request->get("food_state_cat") . ",
        '" . $request->get("food_desc") . "',
        'images/" . $food_image . "',
        0,
        '" . $request->get("food_alias") . "')");

        $data = [];

        $data["msg"] = "food added successfull";
        $data["status"] = "ok";

        return response()->json($data);
    }

    public function add_to_cart(Request $request, $id)
{
    $token = $request->header("authentication");
    $items = $request->get("items");


   
    foreach ($items as $item) {

      
            
        DB::insert("INSERT INTO cart (product_id, token, plates_size, price) VALUES (".$id.", '". $token."', '".$item['plate_size']."', ".$item['price'].")");
    }

    return response()->json(["msg" => "Items added to cart successfully"]);
}

    

    public function show_cart_item(Request $request)
    {
        $token = $request->header("authentication");

        $result = DB::select("SELECT cart.plates_size,cart.price,food_menu.food_name,food_menu.food_image FROM food_menu INNER JOIN cart ON cart.product_id=food_menu.id WHERE cart.token = '".$token."'");

        foreach($result as $row)
        {
            $row->food_image = asset("storage/" . $row->food_image);

        }


        return response()->json($result );

    }



    public function genrateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

        $characterLength = strlen($characters);

        $randomString = '';

        for ($i = 0; $i < $length; $i++) {

            $randomString .= $characters[random_int(0, $characterLength - 1)];
        }
        return $randomString;
    }
}
