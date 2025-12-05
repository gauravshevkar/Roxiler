const router = require("express").Router();
const auth = require("../middlewares/auth");
const { changePassword } = require("../controllers/user.controller");

router.post("/change-password", auth, changePassword);

module.exports = router;
