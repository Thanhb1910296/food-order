import 'package:flutter/material.dart';
import 'package:food_order/features/me/widgets/credit_card.dart';
import 'package:food_order/features/me/services/me_service.dart';
import 'package:food_order/features/me/widgets/location.dart';
import 'package:food_order/features/me/widgets/profile.dart';
import 'package:food_order/features/me/widgets/settings.dart';
import 'package:food_order/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MeScreen extends StatefulWidget {  
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12,top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Text('${user.name}', style: TextStyle(fontSize: 18,color: Colors.white),)
                ],
              ),
            ),
          ),

          // Payment
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditCard() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.payment_outlined, color: Colors.red,),
                      SizedBox(width: 8,),
                      Text('Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Location
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationSetting() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.red,),
                      SizedBox(width: 8,),
                      Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),

          // Your Vouchers
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wallet, color: Colors.yellow,),
                      SizedBox(width: 8,),
                      Text('Promotion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),
          
          // Regulatory Policies
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.content_paste_rounded, color: Colors.green,),
                      SizedBox(width: 8,),
                      Text('Regulatory Policies', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Help Center
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.help_outline_outlined, color: Colors.green,),
                      SizedBox(width: 8,),
                      Text('Help Center', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),

          // Settings
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings, color: Colors.blueAccent,),
                      SizedBox(width: 8,),
                      Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // App for Shop Owner
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.store_mall_directory_outlined, color: Colors.blueAccent,),
                      SizedBox(width: 8,),
                      Text('App for Shop Owner', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),
          
          // About
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade300),
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),                  
              ),
            ),
            child: GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outlined, color: Colors.black,),
                      SizedBox(width: 8,),
                      Text('Regulatory Policies', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 24,),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,),
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
              onPressed: () {
                MeServices().logOut(context);
              },
              child: Text('Sign out', style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.white),),  
            ),
          ),
          
          //Version and Corp
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Column(
                children: [
                  Text('Version 1.0.0', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                  SizedBox(height: 3,),
                  Text('Food Delivery Corporation', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}