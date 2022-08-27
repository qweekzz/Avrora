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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../pages/confirmPass_page.dart' as _i5;
import '../pages/home_page.dart' as _i2;
import '../pages/landing_page.dart' as _i1;
import '../pages/otp_page.dart' as _i8;
import '../pages/reg_page.dart' as _i6;
import '../pages/second_page.dart' as _i4;
import '../pages/sendPassPhone_page.dart' as _i7;
import '../pages/start_page.dart' as _i3;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LandingPageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    HomePageRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    StartRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Start());
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>(
          orElse: () => const SecondRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.Second(key: args.key, userPhone: args.userPhone));
    },
    ConfirmPassRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmPassRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ConfirmPass(userPhone: args.userPhone));
    },
    RegRoute.name: (routeData) {
      final args =
          routeData.argsAs<RegRouteArgs>(orElse: () => const RegRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.Reg(key: args.key));
    },
    SendPassPhonePageRoute.name: (routeData) {
      final args = routeData.argsAs<SendPassPhonePageRouteArgs>(
          orElse: () => const SendPassPhonePageRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i7.SendPassPhonePage(key: args.key, phoneTest: args.phoneTest));
    },
    OtpPageRoute.name: (routeData) {
      final args = routeData.argsAs<OtpPageRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.OtpPage(phoneTest: args.phoneTest));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LandingPageRoute.name, path: '/'),
        _i9.RouteConfig(HomePageRoute.name, path: '/home'),
        _i9.RouteConfig(StartRoute.name, path: '/start'),
        _i9.RouteConfig(HomePageRoute.name, path: '/home'),
        _i9.RouteConfig(SecondRoute.name, path: '/second'),
        _i9.RouteConfig(ConfirmPassRoute.name, path: '/ConfirmPass'),
        _i9.RouteConfig(RegRoute.name, path: '/reg'),
        _i9.RouteConfig(SendPassPhonePageRoute.name, path: '/test'),
        _i9.RouteConfig(OtpPageRoute.name, path: '/otp')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingPageRoute extends _i9.PageRouteInfo<void> {
  const LandingPageRoute() : super(LandingPageRoute.name, path: '/');

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i9.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.Start]
class StartRoute extends _i9.PageRouteInfo<void> {
  const StartRoute() : super(StartRoute.name, path: '/start');

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i4.Second]
class SecondRoute extends _i9.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({_i10.Key? key, dynamic userPhone})
      : super(SecondRoute.name,
            path: '/second',
            args: SecondRouteArgs(key: key, userPhone: userPhone));

  static const String name = 'SecondRoute';
}

class SecondRouteArgs {
  const SecondRouteArgs({this.key, this.userPhone});

  final _i10.Key? key;

  final dynamic userPhone;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, userPhone: $userPhone}';
  }
}

/// generated route for
/// [_i5.ConfirmPass]
class ConfirmPassRoute extends _i9.PageRouteInfo<ConfirmPassRouteArgs> {
  ConfirmPassRoute({required String userPhone})
      : super(ConfirmPassRoute.name,
            path: '/ConfirmPass',
            args: ConfirmPassRouteArgs(userPhone: userPhone));

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
/// [_i6.Reg]
class RegRoute extends _i9.PageRouteInfo<RegRouteArgs> {
  RegRoute({_i10.Key? key})
      : super(RegRoute.name, path: '/reg', args: RegRouteArgs(key: key));

  static const String name = 'RegRoute';
}

class RegRouteArgs {
  const RegRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'RegRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SendPassPhonePage]
class SendPassPhonePageRoute
    extends _i9.PageRouteInfo<SendPassPhonePageRouteArgs> {
  SendPassPhonePageRoute({_i10.Key? key, dynamic phoneTest})
      : super(SendPassPhonePageRoute.name,
            path: '/test',
            args: SendPassPhonePageRouteArgs(key: key, phoneTest: phoneTest));

  static const String name = 'SendPassPhonePageRoute';
}

class SendPassPhonePageRouteArgs {
  const SendPassPhonePageRouteArgs({this.key, this.phoneTest});

  final _i10.Key? key;

  final dynamic phoneTest;

  @override
  String toString() {
    return 'SendPassPhonePageRouteArgs{key: $key, phoneTest: $phoneTest}';
  }
}

/// generated route for
/// [_i8.OtpPage]
class OtpPageRoute extends _i9.PageRouteInfo<OtpPageRouteArgs> {
  OtpPageRoute({required String phoneTest})
      : super(OtpPageRoute.name,
            path: '/otp', args: OtpPageRouteArgs(phoneTest: phoneTest));

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
