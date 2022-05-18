import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../helper/helper.dart';
import '../../../../../../themes/colors.dart';
import 'widgets/setting_pref_domain_select.dart';

class SettingClassPrefScreen extends StatefulWidget {
  @override
  _SettingClassPrefScreenState createState() => _SettingClassPrefScreenState();
}

class _SettingClassPrefScreenState extends State<SettingClassPrefScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildTitleText() {
    return const KText(
      "Setting Klass Preferences",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SettingPrefDomainSelect(),
            const SizedBox(height: 40),
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
