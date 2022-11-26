import 'package:flutter/material.dart';

import 'package:food_order/common/widgets/bottom_bar.dart';

import 'package:food_order/features/merchant/screens/merchant_screen.dart';
import 'package:food_order/features/auth/screens/auth_screen.dart';
import 'package:food_order/features/auth/services/auth_service.dart';

import 'package:provider/provider.dart';
import 'package:food_order/providers/user_provider.dart';

import 'package:food_order/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => genarateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar()
          : const MerchantScreen()
          : const AuthScreen(),
    );
  }
}
