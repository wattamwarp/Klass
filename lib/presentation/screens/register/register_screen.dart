import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_klass/common_widgets/common_widgets.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'package:flutter_app_klass/helper/helper.dart';
import 'package:flutter_app_klass/themes/themes.dart';
// import 'package:klass_app/helper/helper.dart';
// import 'package:klass_app/providers/auth_state.dart';
// import 'package:klass_app/ui/common-widgets/common_widgets.dart';
// import 'package:klass_app/ui/common-widgets/custom_icon_button.dart';
// import 'package:klass_app/ui/screens/auth/login/login_select_role_screen.dart';
// import 'package:klass_app/ui/screens/auth/register/screens/role-select/registration_role_select_screen.dart';
// import 'package:klass_app/ui/themes/themes.dart';
import 'package:provider/provider.dart';

import '../../../themes/colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<void> signUpWithGoogle() async {
    // try {
    //   final authState = Provider.of<AuthState>(context, listen: false);
    //   await authState.authWithGoogle();
    //   if (authState.authorized && authState.error.isEmpty) {
    //     NavigationHelpers.push(context, RegistrationRoleSelectScreen());
    //   } else {
    //     Utility.displaySnackbar(context, msg: authState.error);
    //   }
    // } catch (e) {
    //   Utility.displaySnackbar(context, msg: e.toString());
    // }
  }

  Future<void> signUpWithApple() async {
    //TODO: SIGN UP WITH APPLE
    //NavigationHelpers.push(context, RegistrationRoleSelectScreen());
  }

  Widget _buildImage() {
    return SizedBox(
      height: sizeConfig.safeHeight! * 40,
      width: sizeConfig.safeWidth! * 100,
      child: Image.asset(
        KImages.registrationLogo,
      ),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        KText(
          "Hey,",
          variant: TypographyVariant.titleSmall,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        KText(
          "New to Klass? Register here",
          variant: TypographyVariant.titleSmall,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ],
    );//.pH(20);
  }

  Widget _buildSelectionContainer() {
    return Container(
      width: sizeConfig.safeWidth! * 100,
      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: sizeConfig.safeWidth! * 100,
              child: KIconButton(
                label: "Sign up with Google",
                icon: Image.asset(KImages.googleIcon),
                radius: 25.0,
                onPressed: signUpWithGoogle,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: sizeConfig.safeWidth! * 100,
              child: KIconButton(
                label: "Sign up with Apple",
                icon: Image.asset(KImages.appleIcon),
                radius: 25.0,
                onPressed: signUpWithApple,
              ),
            ),
            const SizedBox(height: 20.0),
            const Divider(
              thickness: 1.0,
              color: KColors.greyButtonColor,
            ),
            const SizedBox(height: 20.0),
            // SizedBox(
            //   width: double.infinity,
            //   child: KButton(
            //     buttonColor: Colors.white,
            //     radius: 25.0,
            //     onPressed: () {},
            //     child: const KText(
            //       "Have a refferal code? Sign up here",
            //       variant: TypographyVariant.h1,
            //       style: TextStyle(color: KColors.primaryColor),
            //     ),
            //   ),
            // ),
            const KText(
              "or",
              variant: TypographyVariant.h1,
              style: TextStyle(color: KColors.activeTextColor),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: KButton(
                buttonColor: Colors.white,
                radius: 25.0,
                onPressed: () {
                  // NavigationHelpers.pushRelacement(
                  //     context, LoginSelectRoleScreen());
                },
                child: const KText(
                  "Already have an account? Sign in",
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
      backgroundColor: KColors.primaryColor,
      appBar: AppBar(
        backgroundColor: KColors.primaryColor,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(),
          _buildText(),
          const SizedBox(height: 10),
          Expanded(child: _buildSelectionContainer()),
        ],
      ),
    );
  }
}
