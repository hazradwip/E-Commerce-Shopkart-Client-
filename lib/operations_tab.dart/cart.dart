// ignore_for_file: deprecated_member_use



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:major_project/screens/buy_now.dart';
import 'package:major_project/screens/firestore/cart_database.dart';


class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  _CardTabState createState() => _CardTabState();
}

class _CardTabState extends State<CartTab> {
  List dataList = [];
  double sum = 0;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList = snapshot.data as List;
            sum = 0;
            for (int i = 0; i < dataList.length; i++) {
              sum = sum + int.parse(dataList[i]['price']);
            }
            return ListView(shrinkWrap: true, children: <Widget>[
              buildItems(dataList),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.grey[300],
                  height: 100,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Total ₹ ' + sum.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          child: const Text('Check Out'),
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BuyNow(total: sum.toString())));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                      color: Colors.grey[300],
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: RaisedButton(
                          child: const Text('Empty Cart'),
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              delete();
                            });
                          },
                        ),
                      )))
            ]);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildItems(dataList) => ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Image.network(dataList[index]['imageUrl']),
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
                    Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      dataList[index]['product_name'],
                      style:
                          const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                  ),
                  Text(
                    dataList[index]['description'],
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                    child: Text(
                      '₹ ' + dataList[index]['price'],
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ]),
              ]),
        );
      });

  void delete() async {
    await FirebaseFirestore.instance
        .collection('Cart')
        .snapshots()
        .forEach((querySnapshot) {
      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        docSnapshot.reference.delete();
      }
    }).whenComplete(
            () => notifier("All items has been deleted Please refresh"));
  }

  void notifier(e) {
    Fluttertoast.showToast(
      msg: e, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }
}
