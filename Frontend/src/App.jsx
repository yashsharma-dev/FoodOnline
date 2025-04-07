import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./components/Home";
import Login from "./components/Login";
import Admin_Dashboard from "./admin/Admin_Dashboard";
import Statics from "./admin/Statics";
import Products_list from "./admin/Products_list";
import AdminNavbar from "./admin/AdminNavbar";
import { Edit } from "lucide-react";
import Add_new_product from "./admin/Add_new_product";
import Add_Cart from "./components/Add_Cart";
// import { LogIn } from "lucide-react";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/admin_dashboard" element={<><AdminNavbar /><Statics/></> } />
        <Route path="/products" element={<><AdminNavbar /><Products_list/></> } />
        <Route path="/addproduct" element={<Add_new_product/> } />
        {/* <Route path="/add_new_product" element={<><Edit/></> } /> */}
      </Routes>
    </Router>
  );
}

export default App;
