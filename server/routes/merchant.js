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

// merchantRouter.get("/merchant/analytics", merchant, async (req, res) => {
//   try {
//     const orders = await Order.find({});
//     let totalEarnings = 0;

//     for (let i = 0; i < orders.length; i++) {
//       for (let j = 0; j < orders[i].products.length; j++) {
//         totalEarnings +=
//           orders[i].products[j].quantity * orders[i].products[j].product.price;
//       }
//     }
//     // CATEGORY WISE ORDER FETCHING
//     let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
//     let essentialEarnings = await fetchCategoryWiseProduct("Essentials");
//     let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
//     let booksEarnings = await fetchCategoryWiseProduct("Books");
//     let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

//     let earnings = {
//       totalEarnings,
//       mobileEarnings,
//       essentialEarnings,
//       applianceEarnings,
//       booksEarnings,
//       fashionEarnings,
//     };

//     res.json(earnings);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// async function fetchCategoryWiseProduct(category) {
//   let earnings = 0;
//   let categoryOrders = await Order.find({
//     "products.product.category": category,
//   });

//   for (let i = 0; i < categoryOrders.length; i++) {
//     for (let j = 0; j < categoryOrders[i].products.length; j++) {
//       earnings +=
//         categoryOrders[i].products[j].quantity *
//         categoryOrders[i].products[j].product.price;
//     }
//   }
//   return earnings;
// }

module.exports = merchantRouter;