import 'package:flutter/material.dart';

class LocationSetting extends StatefulWidget {
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Setting', style: TextStyle(color: Colors.black,),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.red,),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Trần Tiến Thành', style: TextStyle(fontSize: 16),),
                          SizedBox(width: 10,),
                          Text('|'),
                          SizedBox(width: 10,),
                          Text('(+84) 364 132 131', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text('Hẻm 51', style: TextStyle(fontSize: 14),),
                      SizedBox(height: 8,),
                      Text('Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ', style: TextStyle(fontSize: 14),),
                      SizedBox(height: 8,),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red)
                        ),
                        onPressed: (){

                        },
                        child: Text('Default', style: TextStyle(fontSize: 15, color: Colors.red))
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 3, thickness: 2,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        
                      },
                      icon: Icon(Icons.add_circle_outline),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                    Text('Change the shipping address', style: TextStyle(fontSize: 16,color: Colors.red),),
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