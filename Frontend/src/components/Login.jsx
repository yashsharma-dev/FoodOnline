import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function Login({ showlogin, setShowlogin, setIsOpenLogin }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [role, setRole] = useState("user");
  const [error, setError] = useState("");

  const [showPassword, setShowPassword] = useState(false);


  

  const navigate = useNavigate();

  const handleLogin = async (e) => {
   

    let resp = await fetch("http://127.0.0.1:8000/api/login", {
      method: "POST",
      body: JSON.stringify({
        email: email,
        password: password,
        role: role,
      }),
      headers: { "Content-type": "application/json" },
    });

    let result = await resp.json();


    console.log(result);
    


    

    

    if (result.token) {
      let user = { username: result.username, role: result.role };

      localStorage.setItem("user", JSON.stringify(user));
      localStorage.setItem("token", JSON.stringify(result.token));

      console.log("Navigating to home page...");
      navigate("/");
    } else {
      localStorage.clear();
      setError(result.message || "Invalid credentials. Please try again.");
    }


    
  };

  const bgc = "rgb(0,0,0,0.7)";

  return (
    <>
      <div
        style={{
          width: "100vw",
          height: "100vh",
          position: "fixed",
          backgroundColor: bgc,
          zIndex: "200",
          backdropFilter: "blur(5px)",
        }}
      >
        <div className="flex justify-center items-center min-h-screen">
          <div
            style={{ animation: "slideInFromLeft 1s ease-out" }}
            className="max-w-md w-full bg-gradient-to-r from-blue-800 to-purple-600 rounded-xl shadow-2xl overflow-hidden p-8 space-y-8"
          >
            <div className="flex justify-between ">
              <div></div>
              <p></p>
              <h2
                style={{ animation: "appear 2s ease-out" }}
                className=" mx-12 text-center text-4xl font-extrabold text-white"
              >
                Welcome
              </h2>
              <button
                onClick={() => setIsOpenLogin(false)}
                class="  text-gray-600 text-gray-600 hover:bg-white/5 p-1 rounded-md transition-colors ease-linear"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6 18 18 6M6 6l12 12"
                  ></path>
                </svg>
              </button>
            </div>
            <p
              style={{ animation: "appear 3s ease-out" }}
              className="text-center text-gray-200"
            >
              Create Your New Account
            </p>

            {error && <p style={{ color: "red" }}>{error}</p>}

            <div className="space-y-6">
              <div className="relative">
                <input
                  placeholder="john@example.com"
                  className="peer h-10 w-full border-b-2 border-gray-300 text-white bg-transparent placeholder-transparent focus:outline-none focus:border-purple-500"
                  required
                  id="email"
                  name="email"
                  type="email"
                  onChange={(e) => setEmail(e.target.value)}
                  value={email}
                />
                <label
                  className="absolute left-0 -top-3.5 text-gray-500 text-sm transition-all peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-400 peer-placeholder-shown:top-2 peer-focus:-top-3.5 peer-focus:text-purple-500 peer-focus:text-sm"
                  htmlFor="email"
                >
                  Email address
                </label>
              </div>

              <div className="relative">
                <input
                  placeholder="Password"
                  className="peer h-10 w-full border-b-2 border-gray-300 text-white bg-transparent placeholder-transparent focus:outline-none focus:border-purple-500"
                  required
                  id="password"
                  name="password"
                  type={showPassword ? "text" : "password"} 
                  onChange={(e) => setPassword(e.target.value)}
                  value={password}
                />
                <label
                  className="absolute left-0 -top-3.5 text-gray-500 text-sm transition-all peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-400 peer-placeholder-shown:top-2 peer-focus:-top-3.5 peer-focus:text-purple-500 peer-focus:text-sm"
                  htmlFor="password"
                >
                  Password
                </label>

                
                <button
                  type="button" // Prevents the form from submitting when the button is clicked
                  onClick={(e) => {
                    // Prevents the default button behavior
                    setShowPassword(!showPassword);
                  }}
                  className="absolute right-2 top-1/2 transform -translate-y-1/2 text-gray-500 focus:outline-none"
                >
                  {showPassword ? (
                    // <i className="bx bx-show text-white"></i> // Icon to show password
                    <p>show</p>
                  ) : (
                    // <i className="bx bx-hide text-white"></i> // Icon to hide password
                    <p>hide</p>
                  )}
                </button>
              </div>

              <div className="relative">
                <select
                  className="peer h-10 w-full border-b-2 border-gray-300 text-white bg-transparent placeholder-transparent focus:outline-none focus:border-purple-500"
                  required
                  id="role"
                  name="role"
                  onChange={(e) => setRole(e.target.value)}
                  value={role}
                >
                  <option className="text-black" value="user">
                    User
                  </option>
                  <option className="text-black" value="admin">
                    Admin
                  </option>
                </select>
                <label
                  className="absolute left-0 -top-3.5 text-gray-500 text-sm transition-all peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-400 peer-placeholder-shown:top-2 peer-focus:-top-3.5 peer-focus:text-purple-500 peer-focus:text-sm"
                  htmlFor="role"
                >
                  Select Role
                </label>
              </div>

              <button 
              onClick={handleLogin}
              className="w-full py-2 px-4 bg-purple-500 hover:bg-purple-700 rounded-md shadow-lg text-white font-semibold transition duration-200">
                Log In
              </button>
            </div>

            <div className="text-center text-gray-300">
              Don&apos;t have an account?{" "}
              <a
                className="text-purple-300 hover:underline"
                href="#"
                onClick={() => setShowlogin(false)}
              >
                Sign Up
              </a>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Login;
