import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../helper/helper.dart';
import '../../../../../../themes/colors.dart';

class SelectUserRoleField extends StatelessWidget {
  const SelectUserRoleField({
    Key? key,
    required this.userRoleEnum,
  }) : super(key: key);

  final UserRoleEnum userRoleEnum;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authState, child) {
      final isSelected =false;
          //authState.tempRegistrationModel.userRole == userRoleEnum;

      return GestureDetector(
        onTap: () {
          //authState.setUserRole = userRoleEnum;
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: userRoleEnum == UserRoleEnum.student
                  ? const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0)
                  : const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? KColors.primaryColor
                      : KColors.unselectedColor,
                ),
              ),
              child: Row(
                children: [
                  KText(
                    userRoleEnum.asString()!.capitalize(),
                    variant: TypographyVariant.h3,
                    style: TextStyle(
                      color: isSelected
                          ? KColors.primaryColor
                          : KColors.unselectedColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  SvgPicture.asset(
                    userRoleEnum == UserRoleEnum.instructor
                        ? KImages.registrationInstructure
                        : KImages.registrationStudent,
                    color: isSelected
                        ? KColors.primaryColor
                        : KColors.unselectedColor,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -10.0,
              left: 60.0,
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: isSelected
                      ? KColors.primaryColor
                      : KColors.unselectedColor,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
