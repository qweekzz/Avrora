import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/pages/start_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final bool isLoggedIn = user != null;

    // return AutoTabsRouter(
    //   // list of your tab routes
    //   // routes used here must be declaraed as children
    //   // routes of /dashboard
    //   routes: [
    //     // StartRoute(),
    //     HomePageRoute(),
    //   ],
    //   builder: (context, child, animation) {
    //     // obtain the scoped TabsRouter controller using context
    //     final tabsRouter = AutoTabsRouter.of(context);
    //     // Here we're building our Scaffold inside of AutoTabsRouter
    //     // to access the tabsRouter controller provided in this context
    //     //
    //     //alterntivly you could use a global key
    //     return Scaffold(
    //       body: child,
    //     );
    //   },
    // );

    // return Scaffold(
    //   body: isLoggedIn ? HomePage() : Start(),
    // );

    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Center(
    //         child: ElevatedButton(
    //           onPressed: () {
    //             print(isLoggedIn);
    //           },
    //           child: Text('123'),
    //         ),
    //       ),
    //       Center(
    //         child: ElevatedButton(
    //           onPressed: () {
    //             print(isLoggedIn);
    //           },
    //           child: Text('313212'),
    //         ),
    //       )
    //     ],
    //   ),
    // );
    // print(isLoggedIn);

    return isLoggedIn ? const HomePage() : const Start();
  }
}
