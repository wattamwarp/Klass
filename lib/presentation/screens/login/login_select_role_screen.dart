import 'package:flutter/material.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'package:flutter_app_klass/helper/helper.dart';
//import 'package:klass_app/helper/size_configs.dart';
import 'package:flutter_app_klass/common_widgets/common_widgets.dart';


// import 'package:klass_app/ui/screens/auth/login/login_screen.dart';
// import 'package:klass_app/ui/screens/auth/login/widgets/login_select_profile_card.dart';
// import 'package:klass_app/ui/screens/auth/register/register_screen.dart';

import 'package:flutter_app_klass/themes/colors.dart';
//import 'package:klass/helper/extensions.dart';
import 'package:flutter_app_klass/helper/enums.dart';

import 'widgets/login_select_profile_card.dart';

class LoginSelectRoleScreen extends StatefulWidget {
  @override
  _LoginSelectRoleScreenState createState() => _LoginSelectRoleScreenState();
}

class _LoginSelectRoleScreenState extends State<LoginSelectRoleScreen> {
  final ValueNotifier<bool> _isInstructorSelected = ValueNotifier<bool>(true);
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    _isInstructorSelected.dispose();
    super.dispose();
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        KText(
          "Hey Welcome back!",
          variant: TypographyVariant.titleSmall,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        KText(
          "Choose an account type to continue",
          variant: TypographyVariant.h2,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSelectionContainer() {
    final height = sizeConfig.safeHeight!;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isInstructorSelected,
        builder: (BuildContext context, bool isInstructor, Widget? child) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(top: height * 5, bottom: height * 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginSelectProfileCard(
                      userRole: UserRoleEnum.instructor,
                      imagePath: KImages.instructorLoginImage,
                      onTap: () {
                        _isInstructorSelected.value = true;
                      },
                      isSelected: isInstructor,
                    ),
                    SizedBox(height: height * 5),
                    LoginSelectProfileCard(
                      userRole: UserRoleEnum.student,
                      imagePath: KImages.studentLoginImage,
                      onTap: () {
                        _isInstructorSelected.value = false;
                      },
                      isSelected: !isInstructor,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                child!,
              ],
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              child: KButton(
                radius: 25.0,
                onPressed: () {
                  //Navigating to the screen
                  final role = _isInstructorSelected.value
                      ? UserRoleEnum.instructor
                      : UserRoleEnum.student;

                  // NavigationHelpers.push(
                  //   context,
                  //   LoginScreen(
                  //     userRole: role,
                  //   ),
                  // );
                },
                child: const KText(
                  "Next",
                  variant: TypographyVariant.h1,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
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

    final height = sizeConfig.safeHeight!;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: KColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: kToolbarHeight + (height * 10)),
          _buildWelcomeText(),//.pH(20),
          const SizedBox(height: 10.0),
          Expanded(child: _buildSelectionContainer()),
        ],
      ),
    );
  }
}
