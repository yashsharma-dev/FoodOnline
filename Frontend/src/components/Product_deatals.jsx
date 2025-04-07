import React, { useEffect, useState } from "react";
import { X } from "lucide-react";
import { useNavigate } from "react-router-dom";

function ProductDetails({ isShow, setIsShow, id }) {
  const [food, setFood] = useState({});
  const [isLoad, setIsLoad] = useState(false);
  const [plate_size, setPlate_size] = useState([]);
  const [priceList, setPriceList] = useState([]);
  const [user, setUser] = useState(null);
  const [total, setTotal] = useState(0);


  useEffect(() => {
    loadFood();
    setUser(localStorage.getItem("user"));
  }, [id]);

  const loadFood = async () => {
    setIsLoad(true);
    let resp = await fetch(`http://127.0.0.1:8000/api/single_product/${id}`);
    let res = await resp.json();
    setFood(res);
    setIsLoad(false);
  };


  let click_plate_size_handle = (e) => {
    if (e.target.checked) {
      setPlate_size([...plate_size, e.target.value.split("/")[0]]);
      setPriceList([...priceList, e.target.value.split("/")[1]]);
    }
    else {
      setPlate_size(plate_size.filter(item => item != e.target.value.split("/")[0]))
      setPriceList(priceList.filter(item => item != e.target.value.split("/")[0]))
    }
  }




  useEffect(() => {

    let sum = 0;



    priceList.forEach(item => {
      sum = sum + parseInt(item)

    });

    setTotal(sum);

  }, [priceList])


  console.log(plate_size);
  console.log(priceList);
  console.log("total:" + total)



  const addToCart = async () => {
    let token = localStorage.getItem("token");
    token = JSON.parse(token);

    let items = plate_size.map((size, index) => ({
      plate_size: size,
      price: priceList[index]
    }));

    let resp = await fetch(`http://127.0.0.1:8000/api/add_to_cart/${id}`, {
      method: "POST",
      body: JSON.stringify({ items }), // Correct format
      headers: { "Content-type": "application/json", authentication: token },
    });

    let result = await resp.json();
    console.log(result);
  };

  
  return (
    <>
      {isShow && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 backdrop-blur-sm">
          <div className="relative bg-white w-full max-w-5xl h-3/4 flex items-center justify-center rounded-xl shadow-lg p-6 md:p-8">
            {/* Close Button */}
            <button
              className="absolute top-4 right-4 bg-gray-200 hover:bg-gray-300 text-gray-800 p-2 rounded-full"
              onClick={() => setIsShow(false)}
            >
              <X className="w-5 h-5" />
            </button>

            {/* Food Details */}
            {isLoad ? (
              <p className="text-center text-gray-600">Loading...</p>
            ) : (
              <div className="grid md:grid-cols-2 gap-6">
                
                <div className="flex items-center justify-center bg-gray-100 rounded-lg overflow-hidden">
                  <img
                    src={food.food_image}
                    className="w-full h-auto object-cover"
                    alt={food.food_name}
                  />
                </div>

              
                <div className="space-y-4">
                  <h1 className="text-2xl font-bold text-gray-900">{food.food_name}</h1>
                  <p className="text-gray-700">{food.food_desc}</p>

                  
                  {food?.prices?.map((item) => (
                    <div key={item.id} className="flex items-center space-x-3 bg-gray-50 p-3 rounded-lg border cursor-pointer">
                      <input
                        type="checkbox"
                        value={item.plate_size + "/" + item.price}
                        onClick={click_plate_size_handle}
                        className="form-checkbox h-5 w-5 text-blue-600"
                      />
                      <span className="text-gray-700 font-medium">{item.plate_size}</span>
                      <span className="text-gray-900 font-semibold">${item.price}</span>
                    </div>
                  ))}


              
                  <button
                    onClick={addToCart}
                    className="w-full bg-blue-500 hover:bg-blue-600 text-white py-2 rounded-lg mt-4"
                    disabled={plate_size.length == 0}
                  >
                    Add to Cart - ${priceList}
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>
      )}
    </>
  );
}

export default ProductDetails;
