import 'package:flutter/material.dart';

import '../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../helper/helper.dart';
import 'widgets/address_field.dart';
import 'widgets/city_state_view.dart';
import 'widgets/link_social_media.dart';

class InstructorSetupPersonalInfoScreen extends StatefulWidget {
  @override
  _InstructorSetupPersonalInfoScreenState createState() =>
      _InstructorSetupPersonalInfoScreenState();
}

class _InstructorSetupPersonalInfoScreenState
    extends State<InstructorSetupPersonalInfoScreen> {
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
            const AddressField(),
            const SizedBox(height: 30.0),
            const CityStateView(),
            const SizedBox(height: 30.0),
            const LinkSocialMedia(),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: KButton(
                radius: 25.0,
                onPressed: () {
                //    NavigationHelpers.push(context, SettingClassPrefScreen()),
                },
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
