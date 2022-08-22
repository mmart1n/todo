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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../home/home_page.dart' as _i2;
import '../signup/signup_page.dart' as _i1;

class ApppRouter extends _i3.RootStackRouter {
  ApppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignUpPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignUpPage());
    },
    HomePageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SignUpPageRoute.name, path: '/'),
        _i3.RouteConfig(HomePageRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.SignUpPage]
class SignUpPageRoute extends _i3.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i3.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}
