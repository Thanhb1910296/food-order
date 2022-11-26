const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin = async (req, res, next) => {
  try {
    const token = req.session.token;
    if (!token)
      return res.redirect('/sign-in');

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
        return res.redirect('/sign-in');
    const user = await User.findById(verified.id);
    if (user.type == "admin") {
      req.user = verified.id;
      req.token = token;
      return next();
    } else {
        return res.redirect('/sign-in');
    }
    
  } catch (err) {
    return res.redirect('/sign-in');
  }
};

module.exports = admin;