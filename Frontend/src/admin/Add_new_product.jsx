import React, { useEffect, useState } from 'react'

function Add_new_product() {

    const [category, setCategory] = useState([]);
    const [state, setState] = useState([]);
    const [foodName, setFoodName] = useState('');
    const [fooddesc, setFoodDesc] = useState('');
    const [foodImage, setFoodImage] = useState('');
    const [foodAlias, setFoodAlias] = useState('');
    const [state_id, setState_Id] = useState('');
    const [cat_id, setCat_Id] = useState('');
    const [succsess, setSuccsess] = useState(false);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        load_state_name();
        load_category_name();
    }, []);

    const load_state_name = async () => {
        setLoading(true);
        let resp = await fetch("http://127.0.0.1:8000/api/states");
        let res = await resp.json();
        setState(res);
        setLoading(false);
    };

    const load_category_name = async () => {
        setLoading(true);
        let resp = await fetch("http://127.0.0.1:8000/api/category");
        let res = await resp.json();
        setCategory(res);
        setLoading(false);
    };

    const add_products_handle = async (e) => {
        e.preventDefault();

        if (!foodName || !foodAlias || !fooddesc || !foodImage || !state_id || !cat_id) {
            alert("Please fill all the fields");
            return;
        }

        let token = localStorage.getItem("token");
        let user = localStorage.getItem("user");
        user = await JSON.parse(user);
        token = await JSON.parse(token);

        let formdata = new FormData();
        formdata.append("food_name", foodName);
        formdata.append("food_alias", foodAlias);
        formdata.append("food_desc", fooddesc);
        formdata.append("food_image", foodImage);
        formdata.append("food_state_cat", state_id);
        formdata.append("food_main_cat", cat_id);
        formdata.append("role", user.role);

        let resp = await fetch("http://127.0.0.1:8000/api/add_product", {
            method: "POST",
            body: formdata,
            headers: { authentication: token }
        });

        let res = await resp.json();
        if (res.status === "OK") {
            setSuccsess(true);
            setFoodName('');
            setFoodDesc('');
            setFoodImage('');
            setFoodAlias('');
            setState_Id('');
            setCat_Id('');
        }
    };
    return (
        <>
            <section class="bg-white dark:bg-gray-900">
                <div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
                    <h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Add a new product</h2>
                    {succsess && <p style={{ color: "green" }}>Product added successfully</p>}
                    <form onSubmit={add_products_handle}>
                        <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
                            <div class="sm:col-span-2">
                                <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Name</label>
                                <input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Type product name" required=""
                                    onChange={(e) => setFoodName(e.target.value)}
                                    value={foodName} />
                            </div>

                            <div class="w-full">
                                <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">alias</label>
                                <input type="text" name="price" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$2999" required=""
                                    onChange={(e) => setFoodAlias(e.target.value)}
                                    value={foodAlias} />
                            </div>


                            <div class="grid w-full max-w-xs items-center gap-1.5">
                                <label class="text-sm text-gray-900 font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">Picture</label>
                                <input id="picture" type="file" class="flex h-10 w-full rounded-md border border-input bg-white px-3 py-2 text-sm text-gray-400 file:border-0 file:bg-transparent file:text-gray-600 file:text-sm file:font-medium"  onChange={(e) => setFoodImage(e.target.files[0])} />
                            </div>

                            <div>
                                <label for="category" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Category</label>
                                <select id="category" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                    onChange={(e) => setState_Id(e.target.value)}
                                    value={state_id}>
                                    <option selected disabled value="">Select State</option>
                                    {state.map((item) => (
                                        <option key={item.id} value={item.id}>{item.state_name}</option>
                                    ))}
                                </select>
                            </div>
                            <div>
                                <label for="category" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">State Name</label>
                                <select id="category" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                    onChange={(e) => setCat_Id(e.target.value)}
                                    value={cat_id}>
                                    <option selected disabled value="">Select Category</option>
                                    {category.map((item) => (
                                        <option key={item.id} value={item.id}>{item.cat_name}</option>
                                    ))}
                                </select>
                            </div>

                            <div class="sm:col-span-2">
                                <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                                <textarea id="description" rows="8" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Your description here" onChange={(e) => setFoodDesc(e.target.value)}
                                    value={fooddesc}></textarea>
                            </div>
                        </div>
                        <button class="inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">

                            Add New Product
                        </button>
                    </form>
                </div>
            </section>
        </>
    )
}

export default Add_new_product