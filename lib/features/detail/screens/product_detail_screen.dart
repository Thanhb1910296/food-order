import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/common/stars.dart';
import 'package:food_order/common/widgets/custom_button.dart';
import 'package:food_order/constants/global_variables.dart';
import 'package:food_order/features/detail/services/product_detail_service.dart';
import 'package:food_order/features/search/screens/search_screen.dart';
import 'package:food_order/models/product.dart';
import 'package:food_order/providers/user_provider.dart';

import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    // double totalRating = 0;
    // for (int i = 0; i < widget.product.rating!.length; i++) {
    //   totalRating += widget.product.rating![i].rating;
    //   if (widget.product.rating![i].userId ==
    //       Provider.of<UserProvider>(context, listen: false).user.id) {
    //     myRating = widget.product.rating![i].rating;
    //   }
    // }

    // if (totalRating != 0) {
    //   avgRating = totalRating / widget.product.rating!.length;
    // }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.secondaryColor
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(right: 14),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ...',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         widget.product.id!,
            //       ),
            //       Stars(
            //         rating: avgRating,
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     vertical: 20,
            //     horizontal: 10,
            //   ),
            //   child: Text(
            //     widget.product.name,
            //     style: const TextStyle(
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: RichText(
            //     text: TextSpan(
            //       text: 'Deal Price: ',
            //       style: const TextStyle(
            //         fontSize: 16,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       children: [
            //         TextSpan(
            //           text: '\$${widget.product.price}',
            //           style: const TextStyle(
            //             fontSize: 22,
            //             color: Colors.red,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(widget.product.description),
            // ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Text(
            //     'Rate The Product',
            //     style: TextStyle(
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // RatingBar.builder(
            //   initialRating: myRating,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemPadding: const EdgeInsets.symmetric(horizontal: 4),
            //   itemBuilder: (context, _) => const Icon(
            //     Icons.star,
            //     color: GlobalVariables.secondaryColor,
            //   ),
            //   onRatingUpdate: (rating) {
            //     productDetailsServices.rateProduct(
            //       context: context,
            //       product: widget.product,
            //       rating: rating,
            //     );
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.name, style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.product.description, style: TextStyle(fontSize: 16),),
                      SizedBox(height: 18,),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.price.toString() +' đ', style: TextStyle(fontSize: 21, color: Colors.red,),),
                        Container(
                          width: 110,
                          // decoration: BoxDecoration(
                          //   color: Colors.red,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Container(
                              //   color: Colors.red,
                              //   width: 32,
                              //   height: 36,
                              //   child: IconButton(
                              //     onPressed: (){
                              //       //_descreaseCounter();
                              //     },
                              //     icon: Icon(Icons.remove, color: Colors.white, size: 18,)),
                              // ),

                              // Text('1', style: TextStyle(fontSize: 20, color: Colors.black),),
                              
                              Container(
                                color: Colors.red,
                                width: 32,
                                height: 36,
                                child: IconButton(
                                  onPressed: (){
                                    addToCart();
                                    print('Add');
                                  },
                                  icon: Icon(Icons.add, color: Colors.white, size: 18,)
                                
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: CustomButton(
                  //     text: 'Buy Now',
                  //     onTap: () {},
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: CustomButton(
                  //     text: 'Add to Cart',
                  //     onTap: addToCart,
                  //     color: const Color.fromRGBO(254, 216, 19, 1),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
            
                  Divider(height: 5, thickness: 2, color: Colors.grey.shade300,),
                  SizedBox(height: 5,),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Commend', style: TextStyle(fontSize: 18, color: Colors.grey.shade800),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          child: TextField(
                            // controller: _txtController,
                            style: TextStyle(fontSize: 17),
                            maxLines: 6,
                            decoration: InputDecoration.collapsed(hintText: "Enter your cmt here"),
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  )
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   child: Text('Eating salad daily will also increase the power of antioxidants in blood . Loaded with vitamins minerals, fiber, calcium, protein .any type of salads leafy greens have a huge nutritional benefits'
                  //     ,style: TextStyle(fontSize: 14),
                  //     textAlign: TextAlign.justify,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Delivery Time',
                  //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  //         textAlign: TextAlign.justify,
                  //       ),
                  //       Row(
                  //         children: [
                  //           Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5),
                  //             child: Icon(Icons.timer_outlined, color: Colors.red),
                  //           ),
                  //           Text(
                  //             '30'+' Minutes',
                  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  //             textAlign: TextAlign.justify,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  
                  // Padding(       
                  //   padding: EdgeInsets.only(top: 10),
                  //   child: Container(
                  //     margin: EdgeInsets.only(left: 12, top: 16),
                  //     child: ElevatedButton(
                  //       onPressed: (){
                  //         showDialog(
                  //           context: context,
                  //           builder: (context) {
                  //             Future.delayed(Duration(seconds: 2), () {
                  //               Navigator.of(context).pop(true);
                  //             });
                  //             return AlertDialog(
                  //               content: Column(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   Icon(Icons.check_circle_outline, size: 33, color: Colors.green,),
                  //                   SizedBox(height: 5,),
                  //                   Text('Order Successful'),
                  //                 ]
                  //               ),
                  //             );
                  //           }
                  //         );
                  //       },
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(Colors.red),
                  //         padding: MaterialStateProperty.all(
                  //           EdgeInsets.symmetric(
                  //             vertical: 15,
                  //             horizontal: 20,
                  //           ),
                  //         ),
                  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(18.0),
                  //           ),
                  //         ),
                  //       ),
                  //         child: Text('Order Now', style: TextStyle(fontSize: 18,),),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}