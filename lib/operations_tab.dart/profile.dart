import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
          child: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(20),
                  child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 30,
                child: const Text('Profile Details',
                style: TextStyle(fontSize:20),),
              ),
              const Divider(),
              Container(
                alignment: Alignment.center,
                height: 30,
                child: const Text('My Orders',
                style: TextStyle(fontSize:20),),
              ),
              const Divider(),
              Container(
                alignment: Alignment.center,
                height: 30,
                child: const Text('My Cart',
                style: TextStyle(fontSize:20),),
              ),
              const Divider(),
              const SizedBox(height:100),
               Container(
                alignment: Alignment.center,
                height: 30,
                child: const Text('About Us',
                style: TextStyle(fontSize:15),),
              ),
              const Divider(),
              
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.white,
                child: const Text('Log Out',),
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
