import 'package:auto_route/annotations.dart';
import 'package:flutter_app_klass/presentation/screens/screens.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[AutoRoute(page: LoginScreen, initial: true)])
class $AppRouter {}
