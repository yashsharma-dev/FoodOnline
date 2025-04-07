import React, { useEffect, useState } from 'react';
import Card from './Card';

function Home({ stateNameList, setStateNameList, foodcategories, setFoodcategories,catName,setCatName,foodItem,setFoodItem,filterFoodItems,setFilterFoodItems,foodStates,setFoodStates,cat_change_handel,change_state_handle }) {
 

  const [loading, setLoading] = useState(true);



  // const [foodStates , setFoodStates] = useState([]);



  useEffect(() => {
    load_food_items();
    change_state_handle();
    cat_change_handel();

  }, []);

  const load_food_items = async () => {
    setLoading(true);
    let resp = await fetch('http://127.0.0.1:8000/api/home');
    let res = await resp.json();
    setFoodItem(res);
    setLoading(false);
  };



  return (
    <>
      {loading ? (
        <p>Loading....</p>
      ) : (
        <div className="flex flex-wrap justify-center gap-6 p-4 h-full bg-gray-800 flex flex-wrap items-center">
          {foodItem.map((item) => (
            <Card
              key={item.id} // Use a unique key for each card
              name={item.food_name}
              desc={item.food_desc}
              image={item.food_image}
              alias={item.alias}
              price={item.prices}
              foodItem={item}
            />
          ))}
        </div>
      )}
    </>
  );
}

export default Home;
