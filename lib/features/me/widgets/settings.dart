import 'package:flutter/material.dart';

// import 'package:food_delivery_application/view/screens/me/settings/location_setting.dart';
// import 'package:food_delivery_application/view/screens/me/settings/widget/edit_info.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchValue = false;
  int mainAxisValue = 300;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.black,),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.red,),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const EditInfo() ));
        //     },
        //     icon: Icon(Icons.settings, color: Colors.green,),
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.red,),
                SizedBox(width: 8,),
                Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            Divider(height: 15, thickness: 2,),
            SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                // showDialog(
                //   context: context, 
                //   builder: (BuildContext context){
                //     return AlertDialog(
                //       scrollable: mounted,
                //       title: Text('Change password'),
                //       content: Column(
                //         //mainAxisSize: MainAxisSize.min,
                //         children: [
                //           buildChangePasswordTextField(),
                //           buildChangePasswordTextField(),
                //           buildChangePasswordTextField(),
                //           Center(
                //             child: 
                //               ElevatedButton.icon(
                //                 onPressed: (() {                              
                //                 }),
                //                 icon: Icon(Icons.edit, size: 20),
                //                 label: Text('Save', style: TextStyle(fontSize: 16),
                //                 ),
                //               ),
                //           )
                //         ],
                //       ),
                //       actions: [
                //         TextButton(
                //           onPressed: (){
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('Close'),
                //         ),
                //       ],
                //     );
                //   }
                // );

                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade600),),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                ],
              ),
            ),

            SizedBox(height: 32,),

            //
            Row(
              children: [
                Icon(Icons.language_outlined, color: Colors.red,),
                SizedBox(width: 8,),
                Text('Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            Divider(height: 15, thickness: 2,),
            SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ?() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade600),),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                ],
              ),
            ),

            SizedBox(height: 32,),

            Row(
              children: [
                Icon(Icons.notifications_active, color: Colors.red,),
                SizedBox(width: 8,),
                Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
            Divider(height: 15, thickness: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade600),),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: switchValue,
                    onChanged: (bool val) {
                      setState(() {
                        switchValue = val;
                      });
                    },
                  ),
                ),
              ],  
            ),

            SizedBox(height: 32,),

            Center(
              child: OutlinedButton(
                //
                onPressed: () {
                  
                },
                child: Text('Log Out', style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.black),),  
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildChangePasswordTextField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('labelText', style: TextStyle(color: Colors.blue, fontSize: 15),),
          SizedBox(height: 10,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'placeHolder',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey,),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}