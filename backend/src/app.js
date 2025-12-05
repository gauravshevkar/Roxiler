const express = require("express");
const cors = require("cors");
const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Load Models
require("./models");

// Import Routes
const authRoutes = require("./routes/auth.routes");
const adminRoutes = require("./routes/admin.routes");
const storeRoutes = require("./routes/store.routes");
const ratingRoutes = require("./routes/rating.routes");
const ownerRoutes = require("./routes/owner.routes");
const userRoutes = require("./routes/user.routes");

// Route Mapping
app.use("/api/auth", authRoutes);
app.use("/api/admin", adminRoutes);
app.use("/api/stores", storeRoutes);
app.use("/api/ratings", ratingRoutes);
app.use("/api/owner", ownerRoutes);   // ONLY ONCE
app.use("/api/user", userRoutes);     // user change-password route

// Base Route
app.get("/", (req, res) => {
  res.send("Backend running...");
});

module.exports = app;
