// import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:food_order/constants/error_handling.dart';
// import 'package:food_order/constants/global_variables.dart';

import 'package:food_order/constants/utils.dart';

import 'package:food_order/features/auth/screens/auth_screen.dart';

// import 'package:food_order/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class MeServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}