import React, { useEffect, useState } from 'react'
import Header from './Header';
import Home from './Home';

function Main() {


    const [stateNameList, setStateNameList] = useState([]);

    const [foodcategories, setFoodcategories] = useState([]);

    const [catName,setCatName] = useState('all');

     const [foodStates, setFoodStates] = useState([]);
    
      const [filterFoodItems, setFilterFoodItems] = useState([]);
    
      const [foodItem, setFoodItem] = useState([]);


      
  useEffect(()=>{

    let filter_list = foodItem.filter((item)=> stateNameList.find((it)=>item.state_name == it)!=undefined);

    if(catName!=='all'){
      filter_list = filter_list.filter((item)=>item.cat_name==catName);
    }

    setFilterFoodItems(filter_list);

  },[stateNameList,catName]);

  let change_state_handle = (e) => {
    if(e.target.value){

      if(e.target.value == 'all'){
        setStateNameList(foodStates.map((item)=>item.state_name));
      }
      else{
        
        setStateNameList([...stateNameList,e.target.value]);
      }
    }else{
      if(e.target.value == 'all'){
        setStateNameList([]);
        return
      }
      stateNameList(stateNameList.filter((item)=>item != e.target.value));
    }
    
  }

  let cat_change_handel=(e)=>{
    setCatName(e.target.value);
  }


    console.log(stateNameList);
    


    return (
        <>
            <Header
                stateNameList={stateNameList}
                setStateNameList={setStateNameList}
                foodcategories={foodcategories}
                setFoodcategories={setFoodcategories}
                catName= {catName}
                setCatName= {setCatName}

                foodItem = {foodItem}
                setFoodItem = {setFoodItem}
                filterFoodItems ={filterFoodItems}
                setFilterFoodItems ={setFilterFoodItems}
                foodStates = {foodStates}
                setFoodStates ={setFoodStates}

                cat_change_handel={cat_change_handel}
                change_state_handle={change_state_handle}
            />

            <Home
                stateNameList={stateNameList}
                setStateNameList={setStateNameList}
                foodcategories={foodcategories}
                setFoodcategories={setFoodcategories}
                catName= {catName}
                setCatName= {setCatName}

                foodItem = {foodItem}
                setFoodItem = {setFoodItem}
                filterFoodItems ={filterFoodItems}
                setFilterFoodItems ={setFilterFoodItems}
                foodStates = {foodStates}
                setFoodStates ={setFoodStates}

                cat_change_handel={cat_change_handel}
                change_state_handle={change_state_handle}
            />

        </>
    )
}

export default Main