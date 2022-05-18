import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../../../../themes/colors.dart';
//import 'package:klass_app/helper/images.dart';

class SettingPrefDomainSelect extends StatefulWidget {
  const SettingPrefDomainSelect({Key? key}) : super(key: key);

  @override
  _SettingPrefDomainSelectState createState() =>
      _SettingPrefDomainSelectState();
}

class _SettingPrefDomainSelectState extends State<SettingPrefDomainSelect> {
  ///`Domain drop down Item`
  DropdownMenuItem<String> _buildDomainDropDownMenuItem(String name) {
    return DropdownMenuItem<String>(
      value: name,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: KColors.primaryColor,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              KImages.instagramIcon,
              color: Colors.white,
              height: 23.0,
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: KText(
                name,
                variant: TypographyVariant.titleSmall,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///`Domain drop down`
  Widget _buildDomainsDropDown() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: KColors.primaryColor,
          border: Border.all(
            width: 1.2,
            color: KColors.borderColor,
          ),
        ),
        child: Consumer<AuthState>(
          builder: (context, authState, child) => Expanded(
            child: DropdownButton<String>(
              underline: const SizedBox(),
              iconSize: 23,
              icon: Transform.rotate(
                angle: pi / 2,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              isExpanded: true,
              value: "Hell",
              onChanged: (val) {
                //TODO: ADD VAL
              },
              items: <String>["Academic", "Hell", "My", "Maths", "Yp"]
                  .map(
                    (statesEnum) => _buildDomainDropDownMenuItem(statesEnum),
                  )
                  .toList(),
            ),
          ),
        ));
  }

  ///`Subject drop down`
  Widget _buildSubjectsDropDown() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: KColors.primaryColor,
          border: Border.all(
            width: 1.2,
            color: KColors.borderColor,
          ),
        ),
        child: Consumer<AuthState>(
          builder: (context, authState, child) => Expanded(
            child: DropdownButton<String>(
              underline: const SizedBox(),
              iconSize: 23,
              icon: Transform.rotate(
                angle: pi / 2,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              isExpanded: true,
              value: "Hell",
              onChanged: (val) {
                //TODO: ADD VAL
              },
              items: <String>["Academic", "Hell", "My", "Maths", "Yp"]
                  .map(
                    (statesEnum) => _buildDomainDropDownMenuItem(statesEnum),
                  )
                  .toList(),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KText(
          "Select Subjects/Disciplines",
          variant: TypographyVariant.titleSmall,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        const KText(
          "Select all that interest you",
          variant: TypographyVariant.h1,
          style: TextStyle(
            color: KColors.unselectedColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),
        _buildDomainsDropDown(),
        const SizedBox(height: 20),
        _buildSubjectsDropDown(),
      ],
    );
  }
}
