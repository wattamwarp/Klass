import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../../common_widgets/custom_text.dart';
import '../../../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../../../themes/colors.dart';

class SelectGenderField extends StatefulWidget {
  @override
  _SelectGenderFieldState createState() => _SelectGenderFieldState();
}

class _SelectGenderFieldState extends State<SelectGenderField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const KText(
            "Gender",
            variant: TypographyVariant.h2,
            style: TextStyle(
              color: KColors.unselectedColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 20.0),
          Consumer<AuthState>(
            builder: (context, authState, child) => Expanded(
                child: Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: GenderEnum.male,
                      groupValue: authState.tempRegistrationModel.gender,
                      onChanged: (GenderEnum? val) {
                        authState.setUserGender = val!;
                      },
                      activeColor: KColors.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    const KText(
                      "M",
                      variant: TypographyVariant.h2,
                      style: TextStyle(
                        fontSize: 14,
                        color: KColors.unselectedColor,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: GenderEnum.female,
                      groupValue: authState.tempRegistrationModel.gender,
                      onChanged: (GenderEnum? val) {
                        authState.setUserGender = val!;
                      },
                      activeColor: KColors.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    const KText(
                      "F",
                      variant: TypographyVariant.h2,
                      style: TextStyle(
                        fontSize: 14,
                        color: KColors.unselectedColor,
                      ),
                    )
                  ],
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
