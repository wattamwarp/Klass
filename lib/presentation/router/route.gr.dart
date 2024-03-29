// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter_app_klass/helper/enums.dart';

import '../screens/screens.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoginScreen(userRole:UserRoleEnum.student);
        })
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(LoginScreen.name, path: '/')];
}

class LoginScreen extends _i1.PageRouteInfo {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}
