import 'package:cloud_firestore/cloud_firestore.dart';

class Data{

  List list=[];
 
        
   Future getPop()async{
     await FirebaseFirestore.instance
    .collection("Products")
    .get()
    .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
           Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
           
        }
    });
    return list;
   }
  }
