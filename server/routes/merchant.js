const express = require("express");
const merchantRouter = express.Router();
const merchant = require("../middlewares/merchant");
const { Product } = require("../models/product");
const Order = require("../models/order");
const { PromiseProvider } = require("mongoose");

// Add product
merchantRouter.post("/merchant/add-product", merchant, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let userId = req.user;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      userId,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your products
merchantRouter.get("/merchant/get-products", merchant, async (req, res) => {
  let userId = req.user;
  try {
    const products = await Product.find({userId:userId});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the product
merchantRouter.post("/merchant/delete-product", merchant, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

merchantRouter.get("/merchant/get-orders", merchant, async (req, res) => {
  // let userId = req.user;

  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

merchantRouter.post("/merchant/change-order-status", merchant, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = merchantRouter;