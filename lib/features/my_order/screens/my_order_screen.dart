import 'package:flutter/material.dart';

import 'package:food_order/constants/global_variables.dart';
import 'package:food_order/features/home/widgets/address_box.dart';

import 'package:food_order/features/my_order/widgets/order.dart';
import 'package:food_order/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
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
      //           child: Image.asset(
      //             'assets/images/logo.jpg',
      //             width: 120,
      //             height: 45,
      //             color: Colors.black,
      //           ),
      //         ),
      //         Container(
      //           padding: const EdgeInsets.only(left: 15, right: 15),
      //           child: Row(
      //             children: const [
      //               Padding(
      //                 padding: EdgeInsets.only(right: 15),
      //                 child: Icon(Icons.notifications_outlined),
      //               ),
      //               Icon(
      //                 Icons.search,
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        children: const [
          SizedBox(height: 30),
          AddressBox(),
          SizedBox(height: 25),
          SizedBox(height: 20),
          Orders(),
          

        ],
      ),
    );
  }
}