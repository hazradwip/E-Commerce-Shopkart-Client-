// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/screens/confirm_order.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../operations_tab.dart/cart.dart';

// ignore: must_be_immutable
class BuyNow extends StatefulWidget {
  String total;
  BuyNow({Key? key, required this.total}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
late Razorpay _razorpay;

  

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
   
    var options = {
      'key': 'rzp_test_FqmsfukS3vxSov',
      'amount': double.parse(widget.total)*100,
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
     // debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " );
  }

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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              //height: 00,
              //width: 100,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const <Widget>[ Text(
                    'Shipping Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                
                  ),
                  Text('Name : Dwip Hazra'),
                  Text('Phone Number'),
                  Text('Address : Balitikuri Surkimill Manikpirtala'),
                  Text('Pincode : 711113')
                  ]
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: Center(
                  child: Text(
                'Total Amount ₹ ' + widget.total,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  SizedBox(
                    width: 180,
                    child: RaisedButton(
                      onPressed: () {
                        openCheckout();
                      },
                      child: const Text('Online Payment'),
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ConfirmOrd()));
                      },
                      child: const Text('Buy now with COD'),
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
