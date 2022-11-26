console.log('Hello');
const express = require("express");
const mongoose = require("mongoose");
const session = require('express-session');
//
const authRouter = require("./routes/auth");
const merchantRouter = require("./routes/merchant");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const adminRouter = require("./routes/admin");
//
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://thanhb1910296:b1910296@cluster0.bjxnnxf.mongodb.net/?retryWrites=true&w=majority";

//
app.set('view engine', 'ejs');
app.use(session({
    resave: true, 
    saveUninitialized: true, 
    secret: 'somesecret', 
    cookie: { maxAge: 60000 }}));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(authRouter);
app.use(merchantRouter);
app.use(productRouter);
app.use(userRouter);
app.use(adminRouter);

//
mongoose.connect(DB).then(() => {
    console.log("Connection Successful");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});
