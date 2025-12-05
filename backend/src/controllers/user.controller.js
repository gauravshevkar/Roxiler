const bcrypt = require("bcrypt");
const User = require("../models/User.model");

exports.changePassword = async (req, res) => {
  try {
    const userId = req.user.id;
    const { oldPassword, newPassword } = req.body;

    if (!oldPassword || !newPassword) {
      return res.status(400).json({ message: "Both fields are required" });
    }

    const user = await User.findByPk(userId);
    if (!user) return res.status(404).json({ message: "User not found" });

    const isMatch = await bcrypt.compare(oldPassword, user.password);
    if (!isMatch)
      return res.status(400).json({ message: "Old password is incorrect" });

    const hashed = await bcrypt.hash(newPassword, 10);

    await user.update({ password: hashed });

    res.json({ message: "Password updated successfully" });
  } catch (err) {
    console.log("CHANGE PASSWORD ERROR:", err);
    res.status(500).json({ message: "Something went wrong" });
  }
};
