import React, { useEffect, useState } from 'react';
import Card from './Card';
import Product_deatals from './Product_deatals';

function Home() {
  const [food, setFood] = useState([]);
  const [state, setState] = useState([]);
  const [error, setError] = useState(null);
  const [filter, setFilter] = useState([]);
  const [selectedStates, setSelectedStates] = useState([]);

 const [showFood, setShowFood] = useState(false);

  // Fetch food and state data
  useEffect(() => {
    get_all_food();
    state_name();
  }, []);

  const get_all_food = async () => {
    try {
      let resp = await fetch("http://127.0.0.1:8000/api/home");
      let res = await resp.json();
      setFood(res);
      setFilter(res); // Initially set filter to all food items
    } catch (error) {
      setError(error.message);
    }
  };

  const state_name = async () => {
    try {
      let resp = await fetch("http://127.0.0.1:8000/api/states");
      let res = await resp.json();
      setState(res);
    } catch (error) {
      setError(error.message);
    }
  };

  // Update filtered list when selectedStates changes??
  useEffect(() => {
    if (selectedStates.length > 0) {
      const filteredFood = food.filter((item) =>
        selectedStates.includes(item.state_name) // Check if the food item state matches selected states??
      );
      setFilter(filteredFood);
    } else {
      setFilter(food); // No filter, show all food items
    }
  }, [selectedStates, food]);

  // Handle state selection for filtering
  const change_state_handle = (e) => {
    const value = e.target.value;
    if (e.target.checked) {
      setSelectedStates((prevStates) => [...prevStates, value]);
    } else {
      setSelectedStates((prevStates) => prevStates.filter((state) => state !== value));
    }
  };

  return (
    <>
    
      <nav className="bg-white border-gray-200 dark:bg-gray-900 dark:border-gray-700">
        <div className="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
          <a href="#" className="flex items-center space-x-3 rtl:space-x-reverse">
            <img src="https://flowbite.com/docs/images/logo.svg" className="h-8" alt="Flowbite Logo" />
            <span className="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Flowbite</span>
          </a>
          <button
            data-collapse-toggle="navbar-dropdown"
            type="button"
            className="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
            aria-controls="navbar-dropdown"
            aria-expanded="false"
          >
            <span className="sr-only">Open main menu</span>
            <svg className="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
            </svg>
          </button>
          <div className="hidden w-full md:block md:w-auto" id="navbar-dropdown">
            <ul className="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
              <li>
                <a href="#" className="block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500 dark:bg-blue-600 md:dark:bg-transparent" aria-current="page">
                  Home
                </a>
              </li>
              {/* Other nav items */}
              <li>
                <select name="" id="" onChange={change_state_handle}>
                  <option selected disabled value="">
                    Select category
                  </option>
                  {state.length > 0 ? (
                    state.map((item) => (
                      <option key={item.id} value={item.state_name}>
                        {item.state_name}
                      </option>
                    ))
                  ) : (
                    <div className="loading-message">
                      <h2>Loading...</h2>
                    </div>
                  )}
                </select>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div>

        
        {showFood?<Product_deatals setShowFood={setShowFood}/> : null}
      
      
       { error ? (
          <div className="error-message">
            <h2>Error</h2>
            <p>{error}</p>
          </div>
        ) : (
          <div className="w-11/12 h-full flex flex-wrap bg-red-300 gap-10 justify-center m-auto">
            {filter.length > 0 ? (
              filter.map((item) => (
                <div className=" " key={item.id}>
                  <div className="w-60 h-80 bg-gray-800 p-3 flex flex-col gap-1 rounded-br-3xl">
                    <div className="duration-500 contrast-50 h-48 bg-gradient-to-bl from-black via-orange-900 to-indigo-600 hover:contrast-100">
                      <img src={item.food_image} alt="" />
                    </div>
                    <div className="flex flex-col gap-4">
                      <div className="flex flex-row justify-between">
                        <div className="flex flex-col">
                          <span className="text-xl text-gray-50 font-bold">{item.food_name.substring(0, 25)}....</span>
                          <p className="text-xs text-gray-400">{item.food_desc.substring(0, 100)}....</p>
                        </div>
                        <span className="font-bold text-red-600" onClick={()=>(setShowFood(true)(console.log("hello")))}>{item.state_name}</span>

                      </div>
                      <button className="hover:bg-sky-700 text-gray-50 bg-sky-800 py-2 rounded-br-xl">{item.cat_name}</button>
                    </div>
                  </div>
                </div>
              ))
            ) : (
              <div className="loading-message">
                <h2>Loading...</h2>
              </div>
            )}
          </div>
        )}
      </div>
    </>
  );
}

export default Home;
