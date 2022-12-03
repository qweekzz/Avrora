import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/second_page.dart';
import 'package:flutter_app/pages/confirmPass_page.dart';
import 'package:flutter_app/pages/reg_page.dart';
import 'package:flutter_app/pages/otp_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/landing_page.dart';
import 'package:flutter_app/pages/course_page.dart';
import 'package:flutter_app/pages/MainHome.dart';
import 'package:flutter_app/pages/userProfile_Page.dart';
import 'package:flutter_app/pages/myCourses_page.dart';
import 'package:flutter_app/pages/start_page.dart';
import 'package:flutter_app/pages/singleCourse_page.dart';
import 'package:flutter_app/pages/ContentCourse_page.dart';
import 'package:flutter_app/pages/test_page.dart';

import 'package:flutter_app/pages/sendPassPhone_page.dart';
import 'package:flutter_app/routes/router.gr.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

// class CheckIfBookExists extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     final bookId = resolver.route.pathParams.get("bookId");
//     final book = checkIfBookExists(bookId);
//     if (book != null)
//       resolver.next(true); // book was found. proceed to the page
//     else
//       router.push(LandingPageRoute());
//   }
// }

@MaterialAutoRouter(routes: [
  AutoRoute(path: '/', page: LandingPage, initial: true),
  AutoRoute(path: '/home', page: HomePage),
  AutoRoute(path: '/home/:id', page: SinagleCourse),
  AutoRoute(path: '/start', page: Start),
  AutoRoute(path: '/home', page: HomePage),
  AutoRoute(path: '/second', page: Second),
  AutoRoute(path: '/ConfirmPass', page: ConfirmPass),
  AutoRoute(path: '/reg', page: Reg),
  AutoRoute(path: '/test', page: SendPassPhonePage),
  AutoRoute(path: '/otp', page: OtpPage),
  // AutoRoute(path: '/time', page: Test),
  AutoRoute(path: '/time/:id/:lesson', page: ContentCourse),
  AutoRoute(path: '/testPage', page: Test),
  // AutoRoute(path: '/course/:id', page: CoursePage),
])
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final user = Provider.of<User?>(context);
    // final bool isLoggedIn = user != null;
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (1 == 2) {
      // if user is authenticated we continue
      resolver.next(true);
      print('isLoggedIn');
    } else {
      // we redirect the user to our login page
      router.push(HomePageRoute());
      print('isLoggedIn2');
    }
  }
}
