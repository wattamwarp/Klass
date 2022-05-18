import 'package:flutter/material.dart';
import 'package:flutter_app_klass/common_widgets/common_widgets.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';

import '../../../../../../helper/helper.dart';
import '../../../../../../themes/colors.dart';

class StudentSetupPersonalInfoScreen extends StatefulWidget {
  @override
  _StudentSetupPersonalInfoScreenState createState() =>
      _StudentSetupPersonalInfoScreenState();
}

class _StudentSetupPersonalInfoScreenState
    extends State<StudentSetupPersonalInfoScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildTitleText() {
    return const KText(
      "Setting Personal Information",
      variant: TypographyVariant.titleSmall,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }

  Widget _buildForm() {
    final width = sizeConfig.safeWidth! * 100;

    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, bottom: 60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(KImages.uploadImage),
            const SizedBox(height: 40.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: KButton(
                radius: 25.0,
                onPressed: () => null,
                child: const KText(
                  "Next",
                  variant: TypographyVariant.h1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),//.pH(40),
    );
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final height = sizeConfig.safeHeight!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.primaryColor,
        elevation: 0.0,
      ),
      key: _scaffoldKey,
      backgroundColor: KColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 10),
          _buildTitleText(),//.pH(20),
          const SizedBox(height: 10.0),
          Expanded(
            child: _buildForm(),
          ),
        ],
      ),
    );
  }
}
