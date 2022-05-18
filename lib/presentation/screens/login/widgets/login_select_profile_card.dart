import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app_klass/common_widgets/custom_text.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'package:flutter_app_klass/helper/helper.dart';
//import 'package:klass_app/helper/images.dart';

// import 'package:klass_app/helper/extensions.dart';
// import 'package:klass_app/helper/enums.dart';

class LoginSelectProfileCard extends StatelessWidget {
  final UserRoleEnum userRole;
  //final String userRole;
  final String imagePath;
  final Function()? onTap;
  final bool isSelected;

  const LoginSelectProfileCard({
    Key? key,
    required this.userRole,
    required this.imagePath,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: sizeConfig.safeWidth! * 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                imagePath,
              ),
              const SizedBox(height: 20),
              KText(
                //"I'm a ${userRole.asString()!.capitalize()}",
                "I'm a ${userRole.toString()}",
                variant: TypographyVariant.h1,
              ),
            ],
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            isSelected ? KImages.selectedCheck : KImages.unSelectedCheck,
          )
        ],
      ),
    );//.tapIt(() => onTap!());
  }
}
