import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/home.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _number = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25)),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  //controller: _name,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    // ignore: prefer_const_constructors
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    labelText: 'Enter Full Name',
                  ),
                  validator: (String? name) =>
                      (name!.isEmpty) ? 'Provide your full name' : null,
                  controller: _name,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  //controller: nameController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    // ignore: prefer_const_constructors
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    labelText: 'Mobile No.',
                  ),
                  validator: (String? number) =>
                      (number!.isEmpty) ? 'Provide your Phone Number' : null,
                  controller: _number,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  //controller: nameController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    // ignore: prefer_const_constructors
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    labelText: 'Email',
                  ),
                  validator: (String? email) =>
                      (email!.isEmpty) ? 'Provide your Email' : null,
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TextFormField(
                  obscureText: true,
                  //controller: passwordController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                    //suffixIcon: const Icon(Icons.remove_red_eye),
                    // ignore: prefer_const_constructors
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Enter Password',
                  ),
                  validator: (String? password) =>
                      (password!.isEmpty) ? 'Provide your Password' : null,
                  controller: _pass,
                  keyboardType: TextInputType.text,
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: TextField(
                  //obscureText: true,
                  //controller: passwordController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                    // ignore: prefer_const_constructors
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Retype Password',
                  ),
                  
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              // ignore: deprecated_member_use, avoid_unnecessary_containers

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
                    'Sign Up',
                    style: GoogleFonts.lora(),
                  ),

                  onPressed: () {
                    String email=_email.text;
                    String pass=_pass.text;
                    String number=_number.text;
                    String name=_name.text;

                    register(email,name,pass,number);
                  },
                  // ignore: avoid_print
                  // print(nameController.text);
                  // ignore: avoid_print
                  // print(passwordController.text);
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return const Center(child: CircularProgressIndicator());
  }

  /*void submit() {
    if (_key.currentState!.validate()) {
      String name = _name.text;
      String pass = _pass.text;
      String email = _email.text;
      String number = _number.text;

      // ignore: avoid_print
      print('$name , $pass , $email, $number');
    }
  }*/

  void register(email, name, pass, number) async{
    if (_key.currentState!.validate()) {
    var auth = FirebaseAuth.instance;

    await auth.createUserWithEmailAndPassword(email: email, password: pass)
        .then((userCredential ) {
      User? user = userCredential.user;
     user!.sendEmailVerification();
      storeAddData(user.uid, name, number, email);
    }).catchError((onError)  {
              if (onError.code == 'email-already-in-use')
                {notifier('Cant create account using existing email Id');}
              else
                {notifier('$onError');}
            });
            
  }
}



  void notifier(e) {
 Fluttertoast.showToast(
        msg: e,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.BOTTOM,    // location
                      // duration
    );
  }

  Future  storeAddData(String uid, String name, String number, String email) async{

    
  
     final us= FirebaseFirestore.instance.collection("Users").doc(uid);

      await us.set({
      'name': name,
      'email': email,
      'phone': number,
      
    
    }).whenComplete(() => notifier('Account Created'));
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
    
  }
}
