import React, { useState } from "react";
import api from "../api/axiosConfig";
import './css.css'

export default function ChangePassword({ role }) {
  const [form, setForm] = useState({
    oldPassword: "",
    newPassword: "",
  });

  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage("");
    setError("");

    try {
      const endpoint =
        role === "owner"
          ? "/owner/change-password"
          : "/user/change-password";

      const res = await api.post(endpoint, form);
      setMessage(res.data.message);
    } catch (err) {
      setError(err.response?.data?.message || "Failed to change password.");
    }
  };

  return (
    <div className="container change-pass-container">
      <h2>🔐 Change Password ({role})</h2>

      <form onSubmit={handleSubmit} className="change-pass-form">
        <label>Old Password</label>
        <input
          type="password"
          name="oldPassword"
          value={form.oldPassword}
          onChange={handleChange}
          required
        />

        <label>New Password</label>
        <input
          type="password"
          name="newPassword"
          value={form.newPassword}
          onChange={handleChange}
          required
        />

        <button type="submit" className="btn">Update Password</button>
      </form>

      {message && <p className="success">{message}</p>}
      {error && <p className="error">{error}</p>}
    </div>
  );
}
