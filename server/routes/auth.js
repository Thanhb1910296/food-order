const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res
                .status(400)
                .json({ msg: "User with same email already exists!" });
        }
  
        const hashedPassword = await bcryptjs.hash(password, 8);
  
        let user = new User({
            email,
            password: hashedPassword,
            name,
        });

        user = await user.save();
        res.json(user);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;
    
        const user = await User.findOne({ email });
        if (!user) {
            return res
                .status(400)
                .json({ msg: "User with this email does not exist!" });
        }
    
        const isMatch = await bcryptjs.compare(password, user.password);

        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });
        }
  
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  });

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token)
        return res.json(false);

      const verified = jwt.verify(token, "passwordKey");
      if (!verified) 
        return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
        res.json(true);

    } catch (e) {
      res.status(500).json({ error: e.message });
    }
});

authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});
  
authRouter.get("/sign-in", async (req, res) => {
    res.render('index',{
        title: "Login for Administrator",
        page: "signin",
    })
});

authRouter.post("/sign-in-handler", async (req, res) => {
    try {
        const { email, password } = req.body;
    
        const user = await User.findOne({ email:email, type: 'admin' });
        if (!user) {
            return res.render('index',{
                title: "Login for Administrator",
                page: "signin",
                message : "User with this email does not exist!"
            })
        }
    
        const isMatch = await bcryptjs.compare(password, user.password);

        if (!isMatch) {
            return res.render('index',{
                title: "Login for Administrator",
                page: "signin",
                message : "Incorrect password."
            });
        }
  
        const token = jwt.sign({ id: user._id }, "passwordKey");
        req.session.token = token;
        res.redirect('/administrator');
        return;
    } catch (e) {
        return res.render('index',{
            title: "Login for Administrator",
            page: "signin",
            message : e.message
        });
    }
});

authRouter.get("/sign-up-for-merchant", async (req, res) => {
    res.render('index',{
        title: "Sign up for Merchant",
        page: "signup",
    })
});

authRouter.post("/sign-up-for-merchant-handler", async (req, res) => {
    try {
        const { name, email, password, re_password, address } = req.body;
        if(password != re_password){
            return res.render('index',{
                title: "Sign up for Merchant",
                page: "signup",
                message : "Password is not match!"
            });
        } else {
            const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.render('index',{
                title: "Sign up for Merchant",
                page: "signup",
                message : "User with same email already exists!"
            });
        }
  
        const hashedPassword = await bcryptjs.hash(password, 8);
  
        let user = new User({
            email,
            password: hashedPassword,
            name,
            address,
            type: "pre-merchant"
        });

        user = await user.save();
        return res.render('index',{
            title: "Sign up for Merchant",
            page: "signup",
            messageSuccess : "Your request is send to administrator. Please wait administrator approve it!"
        });
    }

    } catch (e) {
        return res.render('index',{
            title: "Sign up for Merchant",
            page: "signup",
            message : e._message
        });
    }
});
module.exports = authRouter;