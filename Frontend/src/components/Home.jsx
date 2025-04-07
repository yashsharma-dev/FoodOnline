import React, { useEffect, useState } from 'react';
import Card from './Card';
import Header from './Header';
import Product_deatals from './Product_deatals';
import Loader from './Loader';
import { LogIn } from 'lucide-react';
import Login from './Login';
import SignUp from './SignUp';
import Account from './Account';
import Add_Cart from './Add_Cart';

function Home() {
  const [foodItem, setFoodItem] = useState([]);
  const [filterFoodItems, setFilterFoodItems] = useState([]);
  const [loading, setLoading] = useState(true);

  const [isOpenLogin, setIsOpenLogin] = useState(false);

  const [cart, setCart] = useState();
  const [showCart, setShowCart] = useState(false);



  const [selectedStates, setSelectedStates] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState('all');


  const [isShow, setIsShow] = useState(false);

  const [showId, setShowId] = useState(0);


  useEffect(() => {
    load_food_items();
  }, []);

  const load_food_items = async () => {
    setLoading(true);
    let resp = await fetch('http://127.0.0.1:8000/api/home');
    let res = await resp.json();
    setFoodItem(res);
    setLoading(false);
  };

  useEffect(() => {
    let filtered = foodItem;

    if (selectedStates.length > 0) {
      filtered = filtered.filter(item => selectedStates.includes(item.state_name));
    }

    if (selectedCategory !== 'all') {
      filtered = filtered.filter(item => item.cat_name === selectedCategory);
    }

    setFilterFoodItems(filtered);
  }, [selectedStates, selectedCategory, foodItem]);

  const change_state_handle = (state) => {
    if (state.state_name === 'all') {
      setSelectedStates([]);
    } else {
      if (selectedStates.includes(state.state_name)) {
        setSelectedStates(selectedStates.filter(s => s !== state.state_name));
      } else {
        setSelectedStates([...selectedStates, state.state_name]);
      }
    }
  };

  const cat_change_handel = (category) => {
    setSelectedCategory(category.cat_name);
  };



  return (
    <>

      {isOpenLogin ? <Account setIsOpenLogin={setIsOpenLogin} /> : null}

      <Header
        cat_change_handel={cat_change_handel}
        change_state_handle={change_state_handle}
        selectedStates={selectedStates}
        selectedCategory={selectedCategory}

        setIsOpenLogin={setIsOpenLogin}


        setShowCart={setShowCart}
      />
      {isShow ? (
        <Product_deatals id={showId} isShow={isShow} setIsShow={setIsShow} />
      ) : null}
      
      {

        loading ? (

        <Loader />
      ) : (
        <div className="flex flex-wrap justify-center gap-6 p-4 bg-gray-800 items-center">
          {filterFoodItems.map((item) => (
            <Card
              key={item.id}
              name={item.food_name}
              desc={item.food_desc}
              image={item.food_image}
              alias={item.alias}
              price={item.price}
              foodItem={item}
              setIsShow={setIsShow}
              id={item.id}
              setShowId={setShowId}
              setCart={setCart}

            />
          ))}
          <Add_Cart cart={cart} setCart={setCart} showCart={showCart} setShowCart={setShowCart} />
        </div>
      )}


    </>
  );
}

export default Home;
