
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class DownloadImage extends StatefulWidget {
  const DownloadImage({Key? key}) : super(key: key);

  @override
  State<DownloadImage> createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  String? downloadURL;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: ElevatedButton(
          child: const Text('Click'),
          onPressed: () async {
            upload();
            
          },
        )),
      ),
    );
  }
//Product Upload 
  Future upload() async {
    ImagePicker _image = ImagePicker();

    try {
      XFile? img = await _image.pickImage(source: ImageSource.gallery);
      File image=File(img!.path);
      Reference str = FirebaseStorage.instance.ref();
      str.child('p1').putFile(image);
    } catch (e){notifier(e);}
    String x=getData("p1").toString();
    storeData( 'High', '1999', 'Killer Black Jeans','Mens Jeans','5', x);

  }

  Future getData(String pName) async {
    try {
      await downloadURLExample(pName);
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample(String name) async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child(name)
        .getDownloadURL();
    
  }
  void notifier(e) {
 Fluttertoast.showToast(
        msg: e,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.BOTTOM,    // location
                      // duration
    );
  }

  Future  storeData( String name, String price, String desc,String cat,String q,String url) async{
     final us= FirebaseFirestore.instance.collection("Products").doc();
     //String ref=FirebaseFirestore.instance.collection("Products").doc().id;
      String ref=us.id;
      await us.set({
      'name': name,
      'price': price,
      'description': desc,
      'category':cat,
      'quantity':q,
      'url': downloadURL,
      'uid':ref
      
    
    }).whenComplete(() => notifier('Account Created'));
   
   
  }
  //Product upload end

}
