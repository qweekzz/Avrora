// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/src/widgets/framework.dart' as _i13;

import '../pages/confirmPass_page.dart' as _i6;
import '../pages/home_page.dart' as _i2;
import '../pages/landing_page.dart' as _i1;
import '../pages/otp_page.dart' as _i9;
import '../pages/reg_page.dart' as _i7;
import '../pages/second_page.dart' as _i5;
import '../pages/sendPassPhone_page.dart' as _i8;
import '../pages/singleCourse_page.dart' as _i3;
import '../pages/start_page.dart' as _i4;
import '../pages/test_page.dart' as _i10;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LandingPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SinagleCourseRoute.name: (routeData) {
      final args = routeData.argsAs<SinagleCourseRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SinagleCourse(
          courseid: args.courseid,
          doc: args.doc,
        ),
      );
    },
    StartRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Start(),
      );
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>(
          orElse: () => const SecondRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.Second(
          key: args.key,
          userPhone: args.userPhone,
        ),
      );
    },
    ConfirmPassRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmPassRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ConfirmPass(userPhone: args.userPhone),
      );
    },
    RegRoute.name: (routeData) {
      final args =
          routeData.argsAs<RegRouteArgs>(orElse: () => const RegRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.Reg(key: args.key),
      );
    },
    SendPassPhonePageRoute.name: (routeData) {
      final args = routeData.argsAs<SendPassPhonePageRouteArgs>(
          orElse: () => const SendPassPhonePageRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SendPassPhonePage(
          key: args.key,
          phoneTest: args.phoneTest,
        ),
      );
    },
    OtpPageRoute.name: (routeData) {
      final args = routeData.argsAs<OtpPageRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.OtpPage(phoneTest: args.phoneTest),
      );
    },
    TestRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.Test(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          LandingPageRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          HomePageRoute.name,
          path: '/home',
        ),
        _i11.RouteConfig(
          SinagleCourseRoute.name,
          path: '/home/:id',
        ),
        _i11.RouteConfig(
          StartRoute.name,
          path: '/start',
        ),
        _i11.RouteConfig(
          HomePageRoute.name,
          path: '/home',
        ),
        _i11.RouteConfig(
          SecondRoute.name,
          path: '/second',
        ),
        _i11.RouteConfig(
          ConfirmPassRoute.name,
          path: '/ConfirmPass',
        ),
        _i11.RouteConfig(
          RegRoute.name,
          path: '/reg',
        ),
        _i11.RouteConfig(
          SendPassPhonePageRoute.name,
          path: '/test',
        ),
        _i11.RouteConfig(
          OtpPageRoute.name,
          path: '/otp',
        ),
        _i11.RouteConfig(
          TestRoute.name,
          path: '/time',
        ),
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingPageRoute extends _i11.PageRouteInfo<void> {
  const LandingPageRoute()
      : super(
          LandingPageRoute.name,
          path: '/',
        );

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i11.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.SinagleCourse]
class SinagleCourseRoute extends _i11.PageRouteInfo<SinagleCourseRouteArgs> {
  SinagleCourseRoute({
    required int courseid,
    required String doc,
  }) : super(
          SinagleCourseRoute.name,
          path: '/home/:id',
          args: SinagleCourseRouteArgs(
            courseid: courseid,
            doc: doc,
          ),
          rawPathParams: {'id': courseid},
        );

  static const String name = 'SinagleCourseRoute';
}

class SinagleCourseRouteArgs {
  const SinagleCourseRouteArgs({
    required this.courseid,
    required this.doc,
  });

  final int courseid;

  final String doc;

  @override
  String toString() {
    return 'SinagleCourseRouteArgs{courseid: $courseid, doc: $doc}';
  }
}

/// generated route for
/// [_i4.Start]
class StartRoute extends _i11.PageRouteInfo<void> {
  const StartRoute()
      : super(
          StartRoute.name,
          path: '/start',
        );

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i5.Second]
class SecondRoute extends _i11.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i13.Key? key,
    dynamic userPhone,
  }) : super(
          SecondRoute.name,
          path: '/second',
          args: SecondRouteArgs(
            key: key,
            userPhone: userPhone,
          ),
        );

  static const String name = 'SecondRoute';
}

class SecondRouteArgs {
  const SecondRouteArgs({
    this.key,
    this.userPhone,
  });

  final _i13.Key? key;

  final dynamic userPhone;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, userPhone: $userPhone}';
  }
}

/// generated route for
/// [_i6.ConfirmPass]
class ConfirmPassRoute extends _i11.PageRouteInfo<ConfirmPassRouteArgs> {
  ConfirmPassRoute({required String userPhone})
      : super(
          ConfirmPassRoute.name,
          path: '/ConfirmPass',
          args: ConfirmPassRouteArgs(userPhone: userPhone),
        );

  static const String name = 'ConfirmPassRoute';
}

class ConfirmPassRouteArgs {
  const ConfirmPassRouteArgs({required this.userPhone});

  final String userPhone;

  @override
  String toString() {
    return 'ConfirmPassRouteArgs{userPhone: $userPhone}';
  }
}

/// generated route for
/// [_i7.Reg]
class RegRoute extends _i11.PageRouteInfo<RegRouteArgs> {
  RegRoute({_i13.Key? key})
      : super(
          RegRoute.name,
          path: '/reg',
          args: RegRouteArgs(key: key),
        );

  static const String name = 'RegRoute';
}

class RegRouteArgs {
  const RegRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.SendPassPhonePage]
class SendPassPhonePageRoute
    extends _i11.PageRouteInfo<SendPassPhonePageRouteArgs> {
  SendPassPhonePageRoute({
    _i13.Key? key,
    dynamic phoneTest,
  }) : super(
          SendPassPhonePageRoute.name,
          path: '/test',
          args: SendPassPhonePageRouteArgs(
            key: key,
            phoneTest: phoneTest,
          ),
        );

  static const String name = 'SendPassPhonePageRoute';
}

class SendPassPhonePageRouteArgs {
  const SendPassPhonePageRouteArgs({
    this.key,
    this.phoneTest,
  });

  final _i13.Key? key;

  final dynamic phoneTest;

  @override
  String toString() {
    return 'SendPassPhonePageRouteArgs{key: $key, phoneTest: $phoneTest}';
  }
}

/// generated route for
/// [_i9.OtpPage]
class OtpPageRoute extends _i11.PageRouteInfo<OtpPageRouteArgs> {
  OtpPageRoute({required String phoneTest})
      : super(
          OtpPageRoute.name,
          path: '/otp',
          args: OtpPageRouteArgs(phoneTest: phoneTest),
        );

  static const String name = 'OtpPageRoute';
}

class OtpPageRouteArgs {
  const OtpPageRouteArgs({required this.phoneTest});

  final String phoneTest;

  @override
  String toString() {
    return 'OtpPageRouteArgs{phoneTest: $phoneTest}';
  }
}

/// generated route for
/// [_i10.Test]
class TestRoute extends _i11.PageRouteInfo<void> {
  const TestRoute()
      : super(
          TestRoute.name,
          path: '/time',
        );

  static const String name = 'TestRoute';
}
