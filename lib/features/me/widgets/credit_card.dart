import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Setting', style: TextStyle(color: Colors.black,),),
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
            //Divider(height: 3, thickness: 2,),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
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
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.credit_card, size: 30,),
                    IconButton(
                      onPressed: () {
                        
                      },
                      icon: Icon(Icons.add_circle_outline),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                    Text('Add new card', style: TextStyle(fontSize: 16,color: Colors.red),),
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