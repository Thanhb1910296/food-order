import 'package:flutter/material.dart';

import 'package:food_order/common/widgets/loading.dart';
import 'package:food_order/common/widgets/single_product.dart';

import 'package:food_order/features/merchant/services/merchant_service.dart';
import 'package:food_order/features/order_detail/screens/order_detail_screen.dart';

import 'package:food_order/models/order.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final MerchantServices merchantServices = MerchantServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await merchantServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
    ? const Loading()
    : SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('All orders (' +  orders!.length.toString() + ')',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orders!.length,
              itemBuilder: (BuildContext context, int index){
                  final orderData = orders![index];
                return GestureDetector(
                  onTap: () {
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        OrderDetailScreen.routeName,
                        arguments: orderData,
                      );
                    };
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 2, top: 8, bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  OrderDetailScreen.routeName,
                                  arguments: orderData,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 130,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(25),
                                      color: Colors.red
                                    ),
                                    // child: SingleProduct(
                                    //   image: orderData.products[0].images[0],
                                    // ),
                                    child: Center(
                                      child: Text('#'+ index.toString(), 
                                      style: TextStyle(fontSize: 20))
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      Text('${DateFormat().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            orderData.orderedAt),
                                      )}'),
                                      Text('Quantity' +orderData.quantity.toString()),
                                    ],
                                  ),
                                ],
                              ),
                              ),
                            ],
                          ),
                        ],
                      )
                    )
                );
              }
            )
          )
        ]
      )
    );
  }
}