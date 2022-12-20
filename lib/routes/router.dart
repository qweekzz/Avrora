import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/second_page.dart';
import 'package:flutter_app/pages/confirmPass_page.dart';
import 'package:flutter_app/pages/reg_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/landing_page.dart';
import 'package:flutter_app/pages/start_page.dart';
import 'package:flutter_app/pages/singleCourse_page.dart';
import 'package:flutter_app/pages/ContentCourse_page.dart';
import 'package:flutter_app/pages/test_page.dart';
import 'package:flutter_app/pages/license_page.dart';
import 'package:flutter_app/routes/router.gr.dart';
import '../services/database.dart';

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
  // AutoRoute(path: '/test', page: SendPassPhonePage),
  // AutoRoute(path: '/otp', page: OtpPage),
  // AutoRoute(path: '/time', page: Test),
  AutoRoute(path: '/time/:id/:lesson', page: ContentCourse),
  AutoRoute(path: '/license', page: License),
  AutoRoute(path: '/testPage', page: Test),
  // AutoRoute(path: '/course/:id', page: CoursePage),
])
class $AppRouter {}

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (1 == 2) {
//       // if user is authenticated we continue
//       debugPrint('$a isLoggedIn');
//       resolver.next(true);
//       print('$a isLoggedIn');
//     } else {
//       // we redirect the user to our login page
//       debugPrint('$a isLoggedIn2');
//       router.push(const HomePageRoute());
//       print('$a isLoggedIn2');
//     }
//   }
// }
