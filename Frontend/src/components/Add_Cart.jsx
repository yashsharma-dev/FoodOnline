import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

function Add_Cart({ cart, setCart, setShowCart, showCart }) {

  const [cartItem, setCartItem] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    load_cart_item();
  },[])

  const load_cart_item = async () => {
    let token = localStorage.getItem("token");
    token = JSON.parse(token);

    setLoading(true);
    let resp = await fetch("http://127.0.0.1:8000/api/show_cart_item", {
      method: "GET",
      headers: { "Content-type": "application/json", authentication: token },

    });

    let res = await resp.json();
    setCartItem(res);
    setLoading(false);
  };


  return (
    <>
      {showCart ?

<div id="cart-dropdown" className="fixed top-0 right-0 w-80 bg-white h-screen shadow-lg p-5 z-50 rounded-lg">
<div className="cart-content-wrap h-full flex flex-col justify-between">
  <div style={{height:"580px"}} className="w-full">
    {/* Cart Header */}
    <div style={{height:"10%"}} className="cart-header flex justify-between items-center border-b pb-3">
      <h2 className="text-xl font-semibold">Cart Review</h2>
      <button
        className="cart-close text-gray-500 hover:text-red-500"
        onClick={() => setShowCart(false)}
        aria-label="Close Cart"
      >
        ✕
      </button>
    </div>

   
      <div style={{height:"90%"}} className="overflow-y-auto pr-2"> 
        <ul className="space-y-4">
          {cartItem.map((item) => (
            <li key={item.id} className="flex items-center border-b pb-3">
              <div className="w-16 h-16 overflow-hidden rounded-md">
                <a href="#">
                  <img src={item.food_image} alt={item.food_name} className="w-full" />
                </a>
              </div>
              <div className="ml-4 flex-1">
                <h3 className="text-sm font-medium">
                  <a href="#" className="hover:underline">{item.food_name}</a>
                </h3>
                <div className="text-lg font-semibold text-gray-700">${item.price}</div>
                <div className="text-lg font-semibold text-gray-700">{item.plate_size}</div>
              </div>
              <button className="text-gray-500 hover:text-red-500" aria-label="Remove item">✕</button>
            </li>
          ))}
        </ul>
      </div>
    
  </div>

  {/* Cart Footer */}
  <div className="cart-footer mt-4 border-t pt-3">
    <h3 className="text-lg font-semibold flex justify-between">
      <span>Subtotal:</span>
      <span className="text-gray-700">$0.00</span>
    </h3>
    <div className="mt-4 flex justify-between">
      <a href="/cart" className="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">View Cart</a>
      <a href="/checkout" className="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600">Checkout</a>
    </div>
  </div>
</div>
</div>
: null}
    </>
  );
}

export default Add_Cart;
