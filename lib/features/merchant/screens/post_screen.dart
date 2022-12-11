import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:food_order/common/widgets/loading.dart';
import 'package:food_order/common/widgets/single_product.dart';
import 'package:food_order/features/me/services/me_service.dart';

import 'package:food_order/features/merchant/screens/add_product_screen.dart';
import 'package:food_order/features/merchant/services/merchant_service.dart';

import 'package:food_order/models/product.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/post_screen';
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final MerchantServices merchantServices = MerchantServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await merchantServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    merchantServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loading()
        : Scaffold(
            // body: GridView.builder(
            //   itemCount: products!.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2),
            //   itemBuilder: (context, index) {
            //     final productData = products![index];
            //     return Column(
            //       children: [
            //         SizedBox(
            //           height: 140,
            //           child: SingleProduct(
            //             image: productData.images[0],
            //           ),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Expanded(
            //               child: Text(
            //                 productData.name,
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 2,
            //               ),
            //             ),
            //             IconButton(
            //               onPressed: () => deleteProduct(productData, index),
            //               icon: const Icon(
            //                 Icons.delete_outline,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     );
            //   },
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('  Food (' +  products!.length.toString() + ')',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black12.withOpacity(0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: (){
                              MeServices().logOut(context);
                            },
                            child: Text(
                              'Sign Out',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products!.length,
                      itemBuilder: (BuildContext context, int index){
                        final productData = products![index];
                        return GestureDetector(
                          onTap: () {
                            // navigateToDetailScreen(index);
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

                                      },
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.orange.shade100
                                        ),
                                        child: SingleProduct(
                                          image: productData.images[0],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                
                                SizedBox(width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.shield, color: Colors.yellow.shade700,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 3, left: 4),
                                              child: Icon(Icons.star, color: Colors.white, size: 16,),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 6, bottom: 6),
                                          padding: EdgeInsets.only(top: 8, right: 5),
                                          constraints: BoxConstraints(
                                            maxWidth: 232,
                                          ),
                                          child: Text(productData.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                            
                                    SizedBox(height: 6,),
                                            
                                    Row(
                                      children: [
                                        // SizedBox(width: 12),
                                        Icon(Icons.star, color: Colors.yellow.shade800, size: 17,),
                                        Text('4.7'),
                                        Text('   |   '),
                                        Icon(Icons.location_on_outlined, color: Colors.black, size: 16,),
                                        Text('1.7'+' km'),
                                        Text('   |   '),
                                        FaIcon(
                                          FontAwesomeIcons.clock, color: Colors.black, size: 12,
                                        ),
                                        Text('18'+' minute'),
                                      ],
                                    ),
                                            
                                    SizedBox(height: 6,),
                                            
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ButtonTheme(
                                          // minWidth: 100,
                                          // height: 30,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              
                                              side: BorderSide(width: 1, color: Colors.red),
                                            ),
                                            onPressed: (){
                                        
                                            },
                                            child: Text('Code 20k off', style: TextStyle(color: Colors.red),),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        IconButton(
                                          onPressed: () => deleteProduct(productData, index),
                                          icon: const Icon(
                                            Icons.delete_outline,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {

                                          },
                                          icon: const Icon(
                                            Icons.more_horiz
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
              backgroundColor: Colors.amber,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}