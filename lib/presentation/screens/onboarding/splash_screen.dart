import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      doAutoLogin();
    });
  }

  void doAutoLogin() async {
    //TODO: CHECK FOR ACCESSTOKEN FOR AUTLOGIN

    //TODO: CREATE PLATFORM AWARE NAVIGATIONS
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (_) => OnBoardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          KImages.appLogo,
        ),
      ),
    );
  }
}
