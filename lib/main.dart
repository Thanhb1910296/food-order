import 'package:flutter/material.dart';
import 'package:food_order/common/widgets/bottom_bar.dart';
import 'package:food_order/features/auth/screens/auth_screen.dart';
import 'package:food_order/features/auth/services/auth_service.dart';
import 'package:food_order/features/home/screens/home_screen.dart';
import 'package:food_order/providers/user_provider.dart';
import 'package:food_order/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => genarateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      // ? Provider.of<UserProvider>(context).user.type == 'user'
      ? const BottomBar()
      : const AuthScreen(),
    );
  }
}
