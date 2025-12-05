const express = require("express");
const router = express.Router();
const auth = require("../middlewares/auth");

const {getStoreRatings, getOwnerDashboard, ownerChangePassword} = require("../controllers/Owner.controller");

// ✔ Owner Ratings
router.get("/ratings", auth, getStoreRatings);

// ✔ Owner Dashboard
router.get("/dashboard", auth, getOwnerDashboard);

// ✔ Change Password
router.post("/change-password", auth, ownerChangePassword);

module.exports = router;
