import 'package:auto_route/auto_route.dart';
import 'package:flutter_app/pages/second_page.dart';
import 'package:flutter_app/pages/confirmPass_page.dart';
import 'package:flutter_app/pages/reg_page.dart';
import 'package:flutter_app/pages/otp_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/landing_page.dart';
import 'package:flutter_app/pages/course_page.dart';

//pages
import 'package:flutter_app/pages/start_page.dart';

import 'package:flutter_app/pages/sendPassPhone_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(path: '/', page: LandingPage, initial: true),
  AutoRoute(path: '/home', page: HomePage, children: [
    AutoRoute(
      path: 'study',
      name: 'studyRouter',
      page: EmptyRouterPage,
      // children: [
      //   AutoRoute(path: '', page: UsersPage),
      //   AutoRoute(path: ':userId', page: UserProfilePage),
      // ],
    ),
    AutoRoute(
      path: 'search',
      name: 'searchRouter',
      page: EmptyRouterPage,
    ),
    AutoRoute(
      path: 'profile',
      name: 'profileRouter',
      page: EmptyRouterPage,
    ),
  ]),
  AutoRoute(path: '/start', page: Start),
  AutoRoute(path: '/home', page: HomePage),
  AutoRoute(path: '/second', page: Second),
  AutoRoute(path: '/ConfirmPass', page: ConfirmPass),
  AutoRoute(path: '/reg', page: Reg),
  AutoRoute(path: '/test', page: SendPassPhonePage),
  AutoRoute(path: '/otp', page: OtpPage),
  // AutoRoute(path: '/course/:id', page: CoursePage),
])
class $AppRouter {}
