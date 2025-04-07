import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

function ProductsList() {


    const [foodItem, setFoodItem] = useState([]);

    useEffect(() => {
        load_food_items();
    }, []);

    const load_food_items = async () => {
        let resp = await fetch('http://127.0.0.1:8000/api/home');
        let res = await resp.json();
        setFoodItem(res);

    };


    return (
        <div className="absolute overflow-x-auto w-9/12 bg-[#ffffff1a] top-0 right-0 my-5 mx-9 shadow-md sm:rounded-lg">
            
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead className="text-xs text-gray-700 uppercase bg-[#ffffff1a] dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" className="px-16 text-gray-50 py-3">
                            <span className="sr-only">Image</span>
                        </th>
                        <th scope="col" className="px-6 text-gray-50 py-3">
                            Product
                        </th>

                        <th scope="col" className="px-6 text-gray-50 py-3">
                            half Price
                        </th>
                        <th scope="col" className="px-6 text-gray-50 py-3">
                            full Price
                        </th>

                        <th scope="col" className="px-6 text-gray-50 py-3">
                            Edits
                        </th>
                        <th scope="col" className="px-6 text-gray-50 py-3">
                            Remove
                        </th>
                    </tr>
                </thead>
                <tbody className='bg-[#ffffff1a]'>
                    {foodItem.map((product, index) => (
                        <tr
                            key={index}
                            className=" bg-[#ffffff1a] border-b dark:bg-gray-800 dark:border-gray-700 border-gray-200 hover:bg-[#ffffff1a] dark:hover:bg-gray-600"
                        >
                            <td className="p-4">
                                <img
                                    src={product.food_image}
                                    className="w-16 md:w-32 max-w-full max-h-full"
                                    alt={product.food_name}
                                />
                            </td>
                            <td className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                                {product.food_name}
                            </td>

                            {product.prices.slice(0,2).map((price, key) => (
                                

                                <td key={key} className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                                    {price.price}
                                </td>
                            ))
                            }
                            <td className="px-6 py-4">
                                <Link
                                    to={'/addproduct'}
                                    className="font-medium text-red-600 dark:text-red-500 hover:underline"
                                >
                                    edits
                                </Link>
                            </td>
                            <td className="px-6 py-4">
                                <a
                                    href="#"
                                    className="font-medium text-red-600 dark:text-red-500 hover:underline"
                                >
                                    Remove
                                </a>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default ProductsList;
