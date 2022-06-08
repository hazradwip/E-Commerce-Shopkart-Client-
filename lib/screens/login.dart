import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/screens/sign_up.dart';


import '../home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          title: Text(
            'Sign In',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        body: Form(
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Text('ShopKart',
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ))),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: _emailController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),

                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use, avoid_unnecessary_containers
                  FlatButton(
                    color: Colors.white10,
                    padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                    onPressed: () {
                      //forgot password screen
                    },
                    textColor: Colors.black,
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.lora(),
                    ),
                  ),
                  Container(
                      height: 60,
                      padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Login',
                          style: GoogleFonts.lora(),
                        ),
                        onPressed: () {
                          String email = _emailController.text;
                          String pass = _passwordController.text;

                          signIn(email, pass);
                        },
                      )),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Does not have account?',
                            style: GoogleFonts.lora(),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            textColor: Colors.black,
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.lora(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                              //signup screen
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              )),
        ));
         
  }

  void signIn(String email, String pass) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      if (value.user!.emailVerified) {
        notifier('SignIn Successful');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
            return const Center(child: CircularProgressIndicator());
      } else {
        notifier('Email verification Pending');
      }
    }).catchError((onError) {
      notifier('$onError');
    });
  }

  void notifier(String e) {
    Fluttertoast.showToast(
      msg: e, // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }
}
