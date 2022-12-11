import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:food_delivery_application/constant.dart';
// import 'package:food_delivery_application/controller/user_controller.dart';
// import 'package:food_delivery_application/data/api/api_response.dart';

// import 'package:food_delivery_application/data/model/user.dart';

// import 'package:food_delivery_application/view/screens/login/login.dart';
// import 'package:food_delivery_application/view/screens/me/settings/widget/edit_info.dart';

// import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtFullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.black,),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.red,),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        
                        color: Colors.grey.shade500
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Form(
            key: formKey,
            child: TextFormField(
              controller: txtFullName,
              validator: (val) => val!.isEmpty ? 'Invalid Name' : null,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 2, top: 25, right: 1),
            child: GestureDetector(
              // onTap: (){
              //   FocusScope.of(context).unfocus();
              // },
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  // Center(
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         width: 100,
                  //         height: 100,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             width: 4,
                  //             color: Colors.red,
                  //           ),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               spreadRadius: 2,
                  //               blurRadius: 10,
                  //               color: Colors.black.withOpacity(0.1),
                  //               offset: Offset(0, 10),
                  //             ),
                  //           ],
                  //           shape: BoxShape.circle,
                  //           image: DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: AssetImage('assets/icon/user.jpg'),
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         child: Container(
                  //           height: 40,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             border: Border.all(
                  //               width: 4,
                  //               color: Colors.red,
                  //             ),
                  //             color: Colors.green,
                  //           ),
                  //           child: Icon(Icons.edit, color: Colors.white,),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 35,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey.shade500),
                        bottom: BorderSide(width: 1, color: Colors.grey.shade500),                  
                      ),
                    ),
                    child: GestureDetector(
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => const EditInfo()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                          Row(
                            children: [
                              Text(txtFullName.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                              SizedBox(width: 3,),
                              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      //loading = true;
                    });
                    // updateUserProfile();
                  }, icon: Icon(Icons.check))
                  // Container(
                  //   height: 18,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.shade300
                  //   ),
                  // ),

                  // Gender
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 14, horizontal: 5),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border(
                  //       top: BorderSide(width: 1, color: Colors.grey.shade500),
                  //       bottom: BorderSide(width: 1, color: Colors.grey.shade500),                  
                  //     ),
                  //   ),
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) => const EditInfo()));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('Birthday', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                  //         Row(
                  //           children: [
                  //             Text('', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                  //             SizedBox(width: 3,),
                  //             Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Birthday
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 14, horizontal: 5),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border(
                  //       top: BorderSide(width: 1, color: Colors.grey.shade500),
                  //       bottom: BorderSide(width: 1, color: Colors.grey.shade500),                  
                  //     ),
                  //   ),
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) => const EditInfo()));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                  //         Row(
                  //           children: [
                  //             Text('Tien Thanh', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                  //             SizedBox(width: 3,),
                  //             Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 35),
    //   child: TextField(
    //     obscureText: isPassword ? showPass : false,
    //     decoration: InputDecoration(
    //       suffixIcon: isPassword ? IconButton(
    //         onPressed: (){
    //           setState(() {
    //             showPass = isPassword;
    //           });
    //         },
    //         icon: Icon(Icons.remove_red_eye,),
    //       ) : null,
    //       contentPadding: EdgeInsets.only(bottom: 3),
    //       labelText: labelText,
    //       labelStyle: TextStyle(fontSize: 20),
    //       floatingLabelBehavior: FloatingLabelBehavior.always,
    //     ),
    //   ),
    // );
}