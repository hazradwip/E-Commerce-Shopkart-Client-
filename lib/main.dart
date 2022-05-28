import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';


import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOEQtRW3qlCFmBLqX69Mwc_Am1tkcYb2M",
      appId: "1:952202347121:android:dc1d01a6b2a86c6c0591d0",
      projectId: "952202347121",
      messagingSenderId: "952202347121"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return   MaterialApp(
      home: SplashScreenView(
        navigateRoute:LogIn(key: key,),
        duration: 7000,
        imageSize: 250,
        imageSrc: "assets/pictures/icon.jpg",
        text: "Welcome to Shopkart",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 40.0,
        ),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.red,
      ),
    );
  }
}
 
