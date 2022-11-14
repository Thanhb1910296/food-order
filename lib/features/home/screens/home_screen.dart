import 'package:flutter/material.dart';
import 'package:food_order/constants/global_variables.dart';
import 'package:food_order/features/home/widgets/address_box.dart';
import 'package:food_order/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //         gradient: GlobalVariables.appBarGradient,
      //       ),
      //     ),
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           alignment: Alignment.topLeft,
      //           child: Image(
      //             image: AssetImage('assets/images/logo.jpg'), 
      //             width: 60,
                  
      //           ),
      //         ),
      //         // Expanded(
      //         //   child: Container(
      //         //     height: 42,
      //         //     margin: const EdgeInsets.only(left: 5, right: 5),
      //         //     child: Material(
      //         //       borderRadius: BorderRadius.circular(7),
      //         //       elevation: 1,
      //         //       child: TextFormField(
      //         //         // onFieldSubmitted: navigateToSearchScreen,
      //         //         decoration: InputDecoration(
      //         //           prefixIcon: InkWell(
      //         //             onTap: () {},
      //         //             child: const Padding(
      //         //               padding: EdgeInsets.only(
      //         //                 left: 6,
      //         //               ),
      //         //               child: Icon(
      //         //                 Icons.search,
      //         //                 color: Colors.black,
      //         //                 size: 23,
      //         //               ),
      //         //             ),
      //         //           ),
      //         //           filled: true,
      //         //           fillColor: Colors.white,
      //         //           contentPadding: const EdgeInsets.only(top: 10),
      //         //           border: const OutlineInputBorder(
      //         //             borderRadius: BorderRadius.all(
      //         //               Radius.circular(7),
      //         //             ),
      //         //             borderSide: BorderSide.none,
      //         //           ),
      //         //           enabledBorder: const OutlineInputBorder(
      //         //             borderRadius: BorderRadius.all(
      //         //               Radius.circular(7),
      //         //             ),
      //         //             borderSide: BorderSide(
      //         //               color: Colors.black38,
      //         //               width: 1,
      //         //             ),
      //         //           ),
      //         //           hintText: 'Search ...',
      //         //           hintStyle: const TextStyle(
      //         //             fontWeight: FontWeight.w500,
      //         //             fontSize: 17,
      //         //           ),
      //         //         ),
      //         //       ),
      //         //     ),
      //         //   ),
      //         // ),
      //         // Container(
      //         //   color: Colors.transparent,
      //         //   height: 42,
      //         //   margin: const EdgeInsets.symmetric(horizontal: 10),
      //         //   child: const Icon(Icons.mic, color: Colors.black, size: 25),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            AddressBox(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            // borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.search),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search ...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.mic, color: Colors.black, size: 25),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), 
              ),
            ),

          ],
        ),
      ),
    );
  }
}