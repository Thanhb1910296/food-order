const mongoose = require("mongoose");
const commentSchema = require("./comment");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  userId: {
    type: String,
    required: true,
    trim: true,
  },

  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  comments: [commentSchema],

});

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };