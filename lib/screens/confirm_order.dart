// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/screens/my_orders.dart';

class ConfirmOrd extends StatelessWidget {
  const ConfirmOrd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.white10,
          elevation: 0,
          title: Text('ShopKart',
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: <Widget>[
            Container(
              child: const Center(
                  child: Text(
                "Order Confirmed !!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              color: Colors.grey[300],
              //width: 500,
              height: 100,
            ),
           
             Container(
                 color: Colors.grey[300],
                 height: 100,
                 //width: 200,
                 child: Padding(
                   padding: const EdgeInsets.all(25),
                   child: RaisedButton(
                     child: const Text('Go to my Orders'),
                     color: const Color.fromRGBO(0, 0, 0, 1),
                     textColor: Colors.white,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30)),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyOrders()));
                     },
                   ),
                 ))
          ]),
        ));
  }
}
