import React from "react";
import { useNavigate } from "react-router-dom";
import "./adminnav.css";
import api from "../api/axiosConfig";

export default function AdminNavbar() {
  const navigate = useNavigate();
  const role = localStorage.getItem("role"); // ✔ get user role

  const handleLogout = async () => {
    if (window.confirm("Are you sure you want to log out?")) {
      try {
        await api.post("/auth/logout");
      } catch (error) {
        console.error("Logout error:", error);
      } finally {
        localStorage.clear();
        navigate("/login");
      }
    }
  };

  // ✔ Role based change password route
  const handleChangePassword = () => {
    if (role === "user") {
      navigate("/user/change-password");
    } else if (role === "owner") {
      navigate("/owner/change-password");
    }  else {
      alert("Invalid role");
    }
  };

  return (
    <header className="admin-navbar">
      <div className="navbar-logo">
        My Application
      </div>

      <div>
        {/* Change Password - Role Based */}
        <button
          className="nav-logout-btn"
          onClick={handleChangePassword}
        >
          Change Password
        </button>

        {/* Logout */}
        <button 
          className="nav-logout-btn"
          onClick={handleLogout}
        >
          Logout
        </button>
      </div>
    </header>
  );
}
