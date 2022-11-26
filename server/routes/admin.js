const express = require("express");
const adminRouter = express.Router();
const Order = require("../models/order");
const checkAdmin = require("../middlewares/admin");
const { Product } = require("../models/product");
const User = require("../models/user");

adminRouter.get("/administrator", checkAdmin, async (req, res) => {
  const merchantList = await User.find({ $or:[{type:'merchant'},{type:"pre-merchant"}] });
  res.render('index',{
    page: "index",
    merchantList : merchantList,
  })
});

adminRouter.get("/administrator/approve/:id", checkAdmin, async (req, res) => {
    let id = req.params.id;
    let user = await User.findById(id);
    user.type = "merchant";
    user = await user.save();
    res.render('index',{
      page: "modal",
      message: "Merchant is approved!"
    })
});

adminRouter.get("/administrator/delete/:id", checkAdmin, async (req, res) => {
  let id = req.params.id;
  let user = await User.findById(id);
  user.type = "";
  user.password = "!"+user.password;
  user = await user.save();
  res.render('index',{
    page: "modal",
    message: "Merchant is deleted!"
  })
});

adminRouter.get("/administrator/customer-management/delete/:id", checkAdmin, async (req, res) => {
  let id = req.params.id;
  let user = await User.findById(id);
  user.type = "";
  user.password = "!"+user.password;
  user = await user.save();
  res.render('index',{
    page: "modal",
    message: "Customer is deleted!",
    returnURL : "/administrator/customer-management"
  })
});

adminRouter.get("/administrator/customer-management", checkAdmin, async (req, res) => {
  const customerList = await User.find({ type:'user'});
  res.render('index',{
    page: "customer-management",
    customerList : customerList
  })
});

adminRouter.get("/administrator/sign-out", checkAdmin, async (req, res) => {
  req.session.destroy(function(err) {
    res.redirect('/sign-in');
  });
});
module.exports = adminRouter;