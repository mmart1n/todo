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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../home/home_page.dart' as _i3;
import '../signup/signup_page.dart' as _i2;
import '../splash/splash_page.dart' as _i1;

class ApppRouter extends _i4.RootStackRouter {
  ApppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignUpPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    HomePageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashPageRoute.name, path: '/'),
        _i4.RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        _i4.RouteConfig(HomePageRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i4.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i4.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}
