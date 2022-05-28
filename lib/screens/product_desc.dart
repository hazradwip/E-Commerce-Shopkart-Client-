import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../operations_tab.dart/cart.dart';

// ignore: must_be_immutable
class ProductDesc extends StatefulWidget {
  String name, price, desc,url,uid;

  ProductDesc({
    Key? key,
    required this.name,
    required this.price,
    required this.desc,
    required this.url,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: const BackButton(color: Colors.black),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartTab()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white10,
        elevation: 0,
        title: Text(
          'ShopKart',
          style: GoogleFonts.lora(
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),

        ),
         
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          SizedBox(
            child: Image.network(widget.url),
            height: 300,
            width: 200,
          ),
          Container(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(widget.desc),
                      Text(widget.price),
                    ]),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                child: Column(children: <Widget>[
              const SizedBox(height: 10),
           
              const SizedBox(height: 15),
              SizedBox(
                width: 200,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    addToCart(widget.name, widget.price, widget.desc,widget.url,widget.uid);
                  },
                  child: const Text('Add to Cart'),
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ])),
          )
        ]),
      ),
    );
  }

  void notifier(e) {
    Fluttertoast.showToast(
      msg: e, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }

  Future addToCart(String name, String price, String desc,String url,String uid) async {
    final us = FirebaseFirestore.instance.collection("Cart").doc();

    await us.set({
      'product_name': name,
      'price': price,
      'description': desc,
      'imageUrl':url,
      'uid':uid
      
    }).whenComplete(() => notifier('Item added to cart'));
  }
}
