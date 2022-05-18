import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../../../../themes/colors.dart';

class CityStateView extends StatelessWidget {
  const CityStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, authState, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: KColors.secondaryDarkColor,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: KColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: KText(
                authState.tempRegistrationModel.city,
                variant: TypographyVariant.h2,
                style: const TextStyle(
                  fontSize: 14,
                  color: KColors.activeTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: KColors.secondaryDarkColor,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: KColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: KText(
                authState.tempRegistrationModel.state.asString() ??
                    "Not selected",
                variant: TypographyVariant.h2,
                style: const TextStyle(
                  fontSize: 14,
                  color: KColors.activeTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
