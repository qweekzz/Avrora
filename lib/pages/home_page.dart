import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 110,
          leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Container(
                // margin: EdgeInsets.only(left: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 108, 14, 164),
                      Color.fromARGB(255, 153, 28, 172)
                    ],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                  ),
                ),
                width: 35,
                height: 35,
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
              )),
        ),
    );
  }
}