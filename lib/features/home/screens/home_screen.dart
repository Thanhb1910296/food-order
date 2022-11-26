import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/common/widgets/action_button.dart';

import 'package:food_order/common/widgets/loading.dart';
import 'package:food_order/common/widgets/single_product.dart';
import 'package:food_order/features/account/services/account_service.dart';

import 'package:food_order/features/detail/screens/product_detail_screen.dart';

import 'package:food_order/features/home/services/home_service.dart';
import 'package:food_order/features/home/widgets/address_box.dart';
import 'package:food_order/features/home/widgets/carousel_image.dart';

import 'package:food_order/features/search/screens/search_screen.dart';

import 'package:food_order/models/product.dart';

import 'package:food_order/providers/user_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Product? product;
  List<Product>? products;
  final HomeService homeService = HomeService();

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  
  void navigateToDetailScreen(int index) {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: products![index],
    );
  }

  fetchAllProducts() async {
    products = await homeService.fetchAllProducts(context);
    // print(products);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            AddressBox(),
            // AccountButton(
            //   text: 'Log Out',
            //   onTap: () => AccountServices().logOut(context),
            // ),
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
                        ),
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.search),
                            Expanded(
                              child: TextFormField(
                                onFieldSubmitted: navigateToSearchScreen,
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

            //
            buildTitle('Best seller'),
            SizedBox(height: 12),
            CarouselImage(),
            
            //
            SizedBox(height: 42),
            buildTitle('Deal of the day'),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/mi-cay.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(blurRadius: 2, spreadRadius: 1, color: Colors.grey),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Mi cay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Text('description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow,),
                            Text('rating' + ' (500)', style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //
            SizedBox(height: 22),
            buildTitle('Food menu'),
            products == null
            ? const Loading()
            : 
            GestureDetector(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products!.length,
                itemBuilder: (BuildContext context, int index){
                  final productData = products![index];
                  return GestureDetector(
                    onTap: () {
                      navigateToDetailScreen(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 22, top: 8, bottom: 30),
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            buildTitle('Deal colection'),
            SizedBox(height: 10),
            // Deal Collection
            CarouselSlider(
              options: CarouselOptions(height: 250.0),
              
              items: [1,2,3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/tra-sua.jpg', 
                          height: 155,
                          width: 260,
                          fit: BoxFit.cover
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Stack(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.shield, color: Colors.yellow.shade700,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Icon(Icons.check, color: Colors.white, size: 16,),
                                )
                              ],
                            ),
                            
                            Container(
                              margin: EdgeInsets.only(left: 6),
                              width: 250,
                              child: Text('Ai Cà Phê - Bờ Hồ Bún Xáng', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],  
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Container buildTitle(String content) {
    return Container(
      margin: EdgeInsets.only(left: 12, bottom: 8, top: 8),
      alignment: Alignment.centerLeft,
      child: Text(content, style: TextStyle(fontSize: 20, color: Colors.red),)
    );
  }

}
  