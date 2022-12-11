
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
  
  
}

class _EditInfoState extends State<EditInfo> {
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.red,
                  ),
                ),
                TextButton(
                  onPressed: (){

                  },
                  child: Text('Save', style: TextStyle(fontSize: 16, color: Colors.red),), 
                ),
              ],
            ),
            Divider(height: 1, thickness: 2,),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade500),
                  bottom: BorderSide(width: 1, color: Colors.grey.shade500),                  
                ),
              ),
              child: TextField(
                controller: TextEditingController()..text = 'Thanh',
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 18, color: Colors.black),

                //initialValue: "Thanh",
                       
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              // child: Label(
              //   triangleHeight: 16,
              //   child: Text('40 characters only')
              // ),
            )
          ],
        ),
      ),
      
    );
  }
}