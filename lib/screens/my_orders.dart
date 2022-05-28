
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'firestore/cart_database.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({ Key? key }) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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



  void notifier(e) {
    Fluttertoast.showToast(
      msg: e, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }
}
