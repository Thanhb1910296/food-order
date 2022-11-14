import 'package:flutter/material.dart';
import 'package:food_order/common/widgets/bottom_bar.dart';

import 'package:food_order/features/auth/screens/auth_screen.dart';
import 'package:food_order/features/home/screens/home_screen.dart';

Route<dynamic> genarateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
  default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Sceen dose not exist!'),
        ),
      )
    );
  }
}