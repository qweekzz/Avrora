import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_app/pages/start_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final bool isLoggedIn = user != null;

    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Center(
    //         child: ElevatedButton(
    //           onPressed: (){
    //             print(isLoggedIn);
    //           },
    //           child: Text('123'),
    //         ),
    //       ),
    //       Center(
    //         child: ElevatedButton(
    //           onPressed: (){
    //             FirebaseAuth.instance.signOut();
    //           },
    //           child: Text('313212'),
    //         ),
    //       )
    //     ],
    //   ),
    // );
    print(isLoggedIn);
    return isLoggedIn ? HomePage() : Start();
  }
}
