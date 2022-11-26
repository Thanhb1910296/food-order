import 'package:flutter/material.dart';

import 'package:food_order/common/widgets/bottom_bar.dart';

import 'package:food_order/features/address/screens/address_screen.dart';
import 'package:food_order/features/merchant/screens/add_product_screen.dart';
import 'package:food_order/features/merchant/screens/post_screen.dart';

import 'package:food_order/features/auth/screens/auth_screen.dart';
import 'package:food_order/features/detail/screens/product_detail_screen.dart';
import 'package:food_order/features/home/screens/home_screen.dart';
import 'package:food_order/features/order_detail/screens/order_detail_screen.dart';
import 'package:food_order/features/search/screens/search_screen.dart';

import 'package:food_order/models/order.dart';
import 'package:food_order/models/product.dart';

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

    case PostScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostScreen(),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
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