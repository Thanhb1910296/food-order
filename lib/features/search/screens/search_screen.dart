import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/common/widgets/loading.dart';
import 'package:food_order/constants/global_variables.dart';
import 'package:food_order/features/detail/screens/product_detail_screen.dart';
import 'package:food_order/features/search/services/search_service.dart';
import 'package:food_order/features/search/widget/searched_product.dart';
import 'package:food_order/models/product.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
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
      body: products == null
      ? const Loading()
      : Column(
        children: [
          //const AddressBox(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailScreen.routeName,
                      arguments: products![index],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 8, top: 8, bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                            products![index].images[0],
                            height: 110,
                            width: 110,
                            fit: BoxFit.fitHeight,
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
                                  child: Text(products![index].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
        ],
      )
    );
  }
}