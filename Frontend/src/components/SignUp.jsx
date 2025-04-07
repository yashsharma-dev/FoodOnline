import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function SignUp({ showlogin, setShowlogin, setIsOpenLogin }) {
  const bgc = "rgb(0,0,0,0.7)";

  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [adminPassword, setAdminPassword] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [role, setRole] = useState("user");
  const [error, setError] = useState("");

  const navigate = useNavigate();

  const registerHandle = async () => {
    try {
      let formData = new FormData();
      formData.append("username", username);
      formData.append("email", email);
      formData.append("password", password);
      formData.append("role", role);
      if (role === "admin") {
        formData.append("adminPassword", adminPassword);
      }

      let resp = await fetch("http://localhost/anime_laravel/Login_core_php/registor.php", {
        method: "POST",
        body: formData,
      });

      let result = await resp.json();

      if (result.status === "OK") {
        const user = { username: result.username, role: result.role };

        localStorage.setItem("user", JSON.stringify(user));
        localStorage.setItem("token", result.token);
        navigate("/");
        window.location.reload();
      } else {
        setError(result.msg || "Something went wrong. Please try again.");
      }
    } catch (error) {
      setError("Network error. Please check your connection and try again.");
    }
  };

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
          <div className="max-w-md w-full bg-gradient-to-r from-blue-800 to-purple-600 rounded-xl shadow-2xl overflow-hidden p-8 space-y-8">
            <div className="flex justify-between">
              <h2 className="mx-12 text-center text-4xl font-extrabold text-white">
                Welcome
              </h2>
              <button
                onClick={() => setIsOpenLogin(false)}
                className="text-gray-600 hover:bg-white/5 p-1 rounded-md transition-colors ease-linear"
              >
                ✖
              </button>
            </div>
            <p className="text-center text-gray-200">Create Your New Account</p>

            {error && <p style={{ color: "red" }}>{error}</p>}

            <div className="space-y-6">
              <input
                placeholder="Username"
                className="w-full border-b-2 border-gray-300 text-white bg-transparent focus:outline-none focus:border-purple-500"
                type="text"
                onChange={(e) => setUsername(e.target.value)}
                value={username}
              />

              <input
                placeholder="Email"
                className="w-full border-b-2 border-gray-300 text-white bg-transparent focus:outline-none focus:border-purple-500"
                type="email"
                onChange={(e) => setEmail(e.target.value)}
                value={email}
              />

              <div className="relative">
                <input
                  placeholder="Password"
                  className="w-full border-b-2 border-gray-300 text-white bg-transparent focus:outline-none focus:border-purple-500"
                  type={showPassword ? "text" : "password"}
                  onChange={(e) => setPassword(e.target.value)}
                  value={password}
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-2 top-1/2 transform -translate-y-1/2 text-gray-500"
                >
                  {showPassword ? "👁" : "🙈"}
                </button>
              </div>

              {role === "admin" && (
                <input
                  placeholder="Admin Password"
                  className="w-full border-b-2 border-gray-300 text-white bg-transparent focus:outline-none focus:border-purple-500"
                  type="password"
                  onChange={(e) => setAdminPassword(e.target.value)}
                  value={adminPassword}
                />
              )}

              <select
                className="w-full border-b-2 border-gray-300 text-white bg-transparent focus:outline-none focus:border-purple-500"
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

              <button
                onClick={registerHandle}
                className="w-full py-2 px-4 bg-purple-500 hover:bg-purple-700 rounded-md shadow-lg text-white font-semibold transition duration-200"
              >
                Sign Up
              </button>
            </div>

            <div className="text-center text-gray-300">
              Already have an account?{" "}
              <a className="text-purple-300 hover:underline" href="#" onClick={() => setShowlogin(true)}>
                Login
              </a>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default SignUp;
