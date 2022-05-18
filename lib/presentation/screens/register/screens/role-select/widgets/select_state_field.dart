import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../themes/colors.dart';

class SelectStateDropDown extends StatefulWidget {
  @override
  _SelectStateDropDownState createState() => _SelectStateDropDownState();
}

class _SelectStateDropDownState extends State<SelectStateDropDown> {
  // DropdownMenuItem<StatesEnum> _buildDropDownMenuItem(StatesEnum statesEnum) {
  //   return DropdownMenuItem<StatesEnum>(
  //     value: statesEnum,
  //     child: KText(
  //       statesEnum.asString()!,
  //       variant: TypographyVariant.h1,
  //       style: KStyles.inputText,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          border: Border.all(
            width: 1.2,
            color: KColors.borderColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              KImages.stateIcon,
              color: KColors.activeTextColor,
            ),
            const SizedBox(width: 10.0),
            Consumer<AuthState>(
              builder: (context, authState, child) => Expanded(
                child: DropdownButton<StatesEnum>(
                  underline: const SizedBox(),
                  icon: Transform.rotate(
                    angle: pi / 2,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: KColors.activeTextColor,
                      size: 20,
                    ),
                  ),
                  isExpanded: true,
                  value: authState.tempRegistrationModel.state,
                  onChanged: (val) {
                    authState.setSelectedState = val!;
                  },
                  items: StatesEnum.values
                      .map(
                        (statesEnum) => _buildDropDownMenuItem(statesEnum),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ));
  }
}
