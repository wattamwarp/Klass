import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'package:flutter_app_klass/helper/helper.dart';
import 'package:flutter_app_klass/common_widgets/common_widgets.dart';
import 'package:flutter_app_klass/common_widgets/custom_icon_button.dart';
import 'package:flutter_app_klass/themes/themes.dart';
import 'package:flutter_app_klass/themes/colors.dart';
import 'package:flutter_app_klass/helper/enums.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({ required this.userRole});

  final UserRoleEnum userRole;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}



// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key, required this.userRole}) : super(key: key);
//
//   final UserRoleEnum userRole;
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildImage() {
    return SizedBox(
      height: sizeConfig.safeHeight! * 20,
      width: sizeConfig.safeWidth! * 100,
      child: Image.asset(
        widget.userRole == UserRoleEnum.instructor
            ? KImages.instructorLoginImage
            : KImages.studentLoginImage,
      ),
    );
  }

  Widget _buildText() {
    return Container(
      margin:const EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          KText(
            "Hey,",
            variant: TypographyVariant.titleSmall,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          KText(
            "Welcome to Klass",
            variant: TypographyVariant.titleSmall,
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ],
      ),
    );//.pH(20);
  }

  Widget _buildSelectionContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: sizeConfig.safeWidth! * 80,
              child: KIconButton(
                label: "Sign in with Google",
                icon: Image.asset(KImages.googleIcon),
                radius: 25.0,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: sizeConfig.safeWidth! * 80,
              child: KIconButton(
                label: "Sign in with Apple",
                icon: Image.asset(KImages.appleIcon.toString()),
                radius: 25.0,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20.0),
            const Divider(
              thickness: 1.0,
              color: KColors.greyButtonColor,//KColors.greyButtonColor,
            ),
            const SizedBox(height: 10.0),
            const KText(
              "Don’t have any account?",
              variant: TypographyVariant.h1,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: sizeConfig.safeWidth! * 80,
              child: KButton(
                buttonColor: Colors.white,
                radius: 25.0,
                onPressed: () {
                  // NavigationHelpers.pushRelacement(
                  //     context, RegisterScreen()); //Navigating to register
                },
                child: const KText(
                  "New to klass? Sign Up",
                  variant: TypographyVariant.h1,
                  style: TextStyle(color: KColors.primaryColor),
                ),
              ),
            )
          ],
        ),//.pH(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);

    return Scaffold(
      backgroundColor:KColors.primaryColor,
      appBar: AppBar(
        backgroundColor: KColors.primaryColor,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight),
          _buildImage(),
          const SizedBox(height: 60),
          _buildText(),
          const SizedBox(height: 10),
          Expanded(child: _buildSelectionContainer()),
        ],
      ),
    );
  }
}
