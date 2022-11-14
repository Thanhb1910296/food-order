import 'package:flutter/material.dart';
import 'package:food_order/models/user.dart';
class UserProvider extends ChangeNotifier{
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    //cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}