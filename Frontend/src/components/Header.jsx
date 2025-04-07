import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

function Header({
  cat_change_handel,
  change_state_handle,
  selectedStates,
  selectedCategory,
  setIsOpenLogin,
  setShowCart
}) {
  const [stateNameList, setStateNameList] = useState([]);
  const [foodcategories, setFoodcategories] = useState([]);
  const [isOpen, setIsOpen] = useState(false);

  const [user, setUser] = useState(null);

  


  useEffect(() => {
    const storedUser = JSON.parse(localStorage.getItem("user"));
    if (storedUser) {
      setUser(storedUser);
    }
  }, []);

  let logout_handle = () => {
    localStorage.clear();
    setUser(null);
  }

  useEffect(() => {
    load_state_name();
    load_category_name();
  }, []);

  const load_state_name = async () => {
    let resp = await fetch("http://127.0.0.1:8000/api/states");
    let res = await resp.json();
    setStateNameList(res);
  };

  const load_category_name = async () => {
    let resp = await fetch("http://127.0.0.1:8000/api/category");
    let res = await resp.json();
    setFoodcategories(res);
  };

  return (
    <>
      <header className="flex w-full border-b bg-gray-900 font-sans min-h-[70px] tracking-wide  z-50">
        <div className="flex flex-wrap items-center justify-between sm:px-10 px-4 py-3 gap-4 w-full max-w-screen-xl mx-auto">
          <a href="javascript:void(0)" className="max-sm:hidden">
            <img
              src="https://readymadeui.com/readymadeui.svg"
              alt="logo"
              className="w-32"
            />
          </a>
          <a href="javascript:void(0)" className="hidden max-sm:block">
            <img
              src="https://readymadeui.com/readymadeui-short.svg"
              alt="logo"
              className="w-9"
            />
          </a>

          <div
            id="collapseMenu"
            className="max-lg:hidden lg:!block max-lg:before:fixed max-lg:before:bg-black max-lg:before:opacity-50 max-lg:before:inset-0 max-lg:before:z-50"
          >
            <button
              id="toggleClose"
              className="lg:hidden fixed top-2 right-4 z-[100] rounded-full bg-white w-9 h-9 flex items-center justify-center border"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-3.5 h-3.5 fill-black"
                viewBox="0 0 320.591 320.591"
              >
                <path
                  d="M30.391 318.583a30.37 30.37 0 0 1-21.56-7.288c-11.774-11.844-11.774-30.973 0-42.817L266.643 10.665c12.246-11.459 31.462-10.822 42.921 1.424 10.362 11.074 10.966 28.095 1.414 39.875L51.647 311.295a30.366 30.366 0 0 1-21.256 7.288z"
                  data-original="#000000"
                ></path>
                <path
                  d="M287.9 318.583a30.37 30.37 0 0 1-21.257-8.806L8.83 51.963C-2.078 39.225-.595 20.055 12.143 9.146c11.369-9.736 28.136-9.736 39.504 0l259.331 257.813c12.243 11.462 12.876 30.679 1.414 42.922-.456.487-.927.958-1.414 1.414a30.368 30.368 0 0 1-23.078 7.288z"
                  data-original="#000000"
                ></path>
              </svg>
            </button>

            <ul className="lg:flex lg:gap-x-10 max-lg:space-y-3 max-lg:fixed max-lg:bg-white max-lg:w-1/2 max-lg:min-w-[300px] max-lg:top-0 max-lg:left-0 max-lg:p-6 max-lg:h-full max-lg:shadow-md max-lg:overflow-auto z-50">
              <li className="mb-6 hidden max-lg:block">
                <a href="javascript:void(0)">
                  <img
                    src="https://readymadeui.com/readymadeui.svg"
                    alt="logo"
                    className="w-36"
                  />
                </a>
              </li>
              <li className="max-lg:border-b max-lg:py-3">
                <a
                  href="javascript:void(0)"
                  className="hover:text-blue-600 text-[15px] font-bold text-blue-600 block"
                >
                  Home
                </a>
              </li>

              {/* States Dropdown */}
              <li className="group max-lg:border-b max-lg:py-3 relative">
                <a
                  href="javascript:void(0)"
                  className="hover:text-[#007bff] text-gray-600 text-[15px] font-bold block"
                >
                  States
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16px"
                    height="16px"
                    className="ml-1 inline-block"
                    viewBox="0 0 24 24"
                  >
                    <path
                      d="M12 16a1 1 0 0 1-.71-.29l-6-6a1 1 0 0 1 1.42-1.42l5.29 5.3 5.29-5.29a1 1 0 0 1 1.41 1.41l-6 6a1 1 0 0 1-.7.29z"
                      data-name="16"
                      data-original="#000000"
                    />
                  </svg>
                </a>
                <ul className="backdrop-blur-md absolute shadow-lg bg-grey-800 space-y-3 lg:top-5 max-lg:top-8 -left-6 min-w-[250px] z-50 max-h-0 overflow-hidden group-hover:opacity-100 group-hover:max-h-[700px] px-6 group-hover:pb-4 group-hover:pt-6 transition-all duration-500">
                  {/* "All States" option (highlight if no state is selected) */}
                  <li
                    key="all-state"
                    onClick={() => change_state_handle({ state_name: "all" })}
                    className={`py-2 border-b hover:text-[#000000] text-white text-[15px] font-bold cursor-pointer rounded ${selectedStates.length === 0 ? "bg-blue-500" : ""
                      }`}
                  >
                    All States
                  </li>
                  {stateNameList.length > 0 ? (
                    stateNameList.map((item) => (
                      <li
                        key={item.id}
                        onClick={() => change_state_handle(item)}
                        className={`py-2 border-b hover:text-[#000000] text-white text-[15px] font-bold cursor-pointer rounded ${selectedStates.includes(item.state_name)
                            ? "bg-blue-500"
                            : ""
                          }`}
                      >
                        {item.state_name}
                      </li>
                    ))
                  ) : (
                    <li>Loading...</li>
                  )}
                </ul>
              </li>

              {/* Category Dropdown */}
              <li className="group max-lg:border-b max-lg:py-3 relative">
                <a
                  href="javascript:void(0)"
                  className="hover:text-[#007bff] text-gray-600 text-[15px] font-bold block"
                >
                  Category
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16px"
                    height="16px"
                    className="ml-1 inline-block"
                    viewBox="0 0 24 24"
                  >
                    <path
                      d="M12 16a1 1 0 0 1-.71-.29l-6-6a1 1 0 0 1 1.42-1.42l5.29 5.3 5.29-5.29a1 1 0 0 1 1.41 1.41l-6 6a1 1 0 0 1-.7.29z"
                      data-name="16"
                      data-original="#000000"
                    />
                  </svg>
                </a>
                <ul className="backdrop-blur-md absolute shadow-lg bg-grey-900 space-y-3 lg:top-5 max-lg:top-8 -left-6 min-w-[250px] z-50 max-h-0 overflow-hidden group-hover:opacity-100 group-hover:max-h-[700px] px-6 group-hover:pb-4 group-hover:pt-6 transition-all duration-500">
                  {/* "All Categories" option (highlight if selectedCategory is "all") */}
                  <li
                    key="all-cat"
                    onClick={() => cat_change_handel({ cat_name: "all" })}
                    className={`py-2 border-b hover:text-[#000000] text-white text-[15px] font-bold cursor-pointer rounded ${selectedCategory === "all" ? "bg-blue-500" : ""
                      }`}
                  >
                    All Categories
                  </li>
                  {foodcategories.length > 0 ? (
                    foodcategories.map((item) => (
                      <li
                        key={item.id}
                        onClick={() => cat_change_handel(item)}
                        className={`py-2 border-b hover:text-[#000000] text-white text-[15px] font-bold cursor-pointer rounded ${selectedCategory === item.cat_name
                            ? "bg-blue-500"
                            : ""
                          }`}
                      >
                        {item.cat_name}
                      </li>
                    ))
                  ) : (
                    <li>Loading...</li>
                  )}
                </ul>
              </li>

              <li className="max-lg:border-b max-lg:py-3">
                <a
                  href="javascript:void(0)"
                  className="hover:text-[#007bff] text-gray-600 text-[15px] font-bold block"
                >
                  Team
                </a>
              </li>
            </ul>
          </div>

          <div className="flex items-center space-x-8 max-lg:ml-auto">
            <input
              type="email"
              placeholder="Search..."
              className="w-full px-4 py-2 border rounded-md bg-transparent text-gray-600 font-semibold text-[15px]"
            />
            <span className="relative">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20px"
                className=" cursor-pointer fill-[#fff] hover:fill-[#007bff] inline"
                viewBox="0 0 64 64"
              >
                <path
                  d="M45.5 4A18.53 18.53 0 0 0 32 9.86 18.5 18.5 0 0 0 0 22.5C0 40.92 29.71 59 31 59.71a2 2 0 0 0 2.06 0C34.29 59 64 40.92 64 22.5A18.52 18.52 0 0 0 45.5 4ZM32 55.64C26.83 52.34 4 36.92 4 22.5a14.5 14.5 0 0 1 26.36-8.33 2 2 0 0 0 3.27 0A14.5 14.5 0 0 1 60 22.5c0 14.41-22.83 29.83-28 33.14Z"
                  data-original="#000000"
                />
              </svg>
              <span className="absolute left-auto -ml-1 top-0 rounded-full bg-blue-600 px-1 py-0 text-xs text-white">
                0
              </span>
            </span>
            <span className="relative" onClick={()=>setShowCart(true)}>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20px"
                height="20px"
                className="cursor-pointer fill-[#fff] hover:fill-[#007bff] inline"
                viewBox="0 0 512 512"
              >
                <path
                  d="M164.96 300.004h.024c.02 0 .04-.004.059-.004H437a15.003 15.003 0 0 0 14.422-10.879l60-210a15.003 15.003 0 0 0-2.445-13.152A15.006 15.006 0 0 0 497 60H130.367l-10.722-48.254A15.003 15.003 0 0 0 105 0H15C6.715 0 0 6.715 0 15s6.715 15 15 15h77.969c1.898 8.55 51.312 230.918 54.156 243.71C131.184 280.64 120 296.536 120 315c0 24.812 20.188 45 45 45h272c8.285 0 15-6.715 15-15s-6.715-15-15-15H165c-8.27 0-15-6.73-15-15 0-8.258 6.707-14.977 14.96-14.996zM477.114 90l-51.43 180H177.032l-40-180zM150 405c0 24.813 20.188 45 45 45s45-20.188 45-45-20.188-45-45-45-45 20.188-45 45zm45-15c8.27 0 15 6.73 15 15s-6.73 15-15 15-15-6.73-15-15 6.73-15 15-15zm167 15c0 24.813 20.188 45 45 45s45-20.188 45-45-20.188-45-45-45-45 20.188-45 45zm45-15c8.27 0 15 6.73 15 15s-6.73 15-15 15-15-6.73-15-15 6.73-15 15-15zm0 0"
                  data-original="#000000"
                ></path>
              </svg>
              <span className="absolute left-auto -ml-1 top-0 rounded-full bg-blue-600 px-1 py-0 text-xs text-white">
                0
              </span>
            </span>
            <ul>
              <li
                id="profile-dropdown-toggle"
                className="relative px-1 after:absolute after:bg-black after:w-full after:h-[2px] after:block after:top-8 after:left-0 after:transition-all after:duration-300"
              >
                <svg
                  onClick={() => setIsOpen(!isOpen)}
                  xmlns="http://www.w3.org/2000/svg"
                  width="24px"
                  height="24px"
                  className="text-white cursor-pointer fill-[#fff] hover:fill-[#007bff]"
                  viewBox="0 0 512 512"
                >
                  <path
                    d="M437.02 74.981C388.667 26.629 324.38 0 256 0S123.333 26.629 74.98 74.981C26.629 123.333 0 187.62 0 256s26.629 132.667 74.98 181.019C123.333 485.371 187.62 512 256 512s132.667-26.629 181.02-74.981C485.371 388.667 512 324.38 512 256s-26.629-132.667-74.98-181.019zM256 482c-66.869 0-127.037-29.202-168.452-75.511C113.223 338.422 178.948 290 256 290c-49.706 0-90-40.294-90-90s40.294-90 90-90 90 40.294 90 90-40.294 90-90 90c77.052 0 142.777 48.422 168.452 116.489C383.037 452.798 322.869 482 256 482z"
                    data-original="#000000"
                  />
                </svg>
                {isOpen && (
                  <div
                    id="profile-dropdown-menu"
                    className="bg-grey backdrop-blur-lg block z-20 shadow-lg py-6 px-6 rounded sm:min-w-[320px] max-sm:min-w-[250px] absolute right-0 top-10"
                  >
                    <h6 className="font-semibold text-white text-[15px]">
                      Welcome
                    </h6>
                    <p className=" text-white text-sm text-gray-500 mt-1">
                      {user ? user.username : " To access account and manage orders"}
                    </p>


                    {user ?

                      
                        <div>

                    <button onClick={logout_handle} class="group flex items-center justify-start w-11 h-11 bg-transparent  rounded-full cursor-pointer relative overflow-hidden transition-all duration-200 shadow-lg hover:w-32 hover:rounded-lg active:translate-x-1 active:translate-y-1">
                      <div class="flex items-center justify-center w-full transition-all duration-300 group-hover:justify-start group-hover:px-3">
                        <svg class="w-4 h-4" viewBox="0 0 512 512" fill="white">
                          <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                        </svg>
                      </div>
                      <div class="absolute right-5 transform translate-x-full opacity-0 text-white text-lg font-semibold transition-all duration-300 group-hover:translate-x-0 group-hover:opacity-100">
                        Logout
                      </div>
                    </button>

                        {

                          <button class="group flex items-center justify-start w-11 h-11 bg-transparent  rounded-full cursor-pointer relative overflow-hidden transition-all duration-200 shadow-lg hover:w-32 hover:rounded-lg active:translate-x-1 active:translate-y-1">
                      <Link to={"/admin_dashboard"}>
                      <div class="absolute text-xs right-5 transform translate-x-full opacity-0 text-white text-lg font-semibold transition-all duration-300 group-hover:translate-x-0 group-hover:opacity-100">
                        Admin DashBoard
                      </div>
                      </Link>
                    </button>
                    }
                        </div>

                      :
                     ( <a
                        to="/login"
                        className="bg-transparent border border-gray-300 hover:border-black rounded px-4 py-2 mt-4 text-sm text-white inline-block"
                        onClick={() => {
                          setIsOpenLogin(true);
                          setIsOpen(false);
                        }}
                      >
                        LOGIN / SIGNUP
                      </a>
                     )

                    }


                    <hr className="border-b-0 my-4" />


                    <ul className="space-y-1.5">
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Order
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Wishlist
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Gift Cards
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Contact Us
                        </a>
                      </li>
                    </ul>
                    <hr className="border-b-0 my-4" />
                    <ul className="space-y-1.5">
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Coupons
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Saved Credits
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Contact Us
                        </a>
                      </li>
                      <li>
                        <a
                          href="javascript:void(0)"
                          className="text-sm text-white hover:text-black"
                        >
                          Saved Addresses
                        </a>
                      </li>
                    </ul>
                  </div>
                )}
              </li>
            </ul>
            <button id="toggleOpen" className="lg:hidden">
              <svg
                className="w-7 h-7"
                fill="#000"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fillRule="evenodd"
                  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                  clipRule="evenodd"
                ></path>
              </svg>
            </button>
          </div>
        </div>
      </header>
    </>
  );
}

export default Header;
