import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common_widgets/common_widgets.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../themes/colors.dart';

class LinkSocialMedia extends StatefulWidget {
  const LinkSocialMedia({Key? key}) : super(key: key);

  @override
  _LinkSocialMediaState createState() => _LinkSocialMediaState();
}

class _LinkSocialMediaState extends State<LinkSocialMedia> {
  Widget _buildSocialMediaRowItem(String title, String imagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(imagePath),
              KText(
                title,
                variant: TypographyVariant.h2,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: KColors.unselectedColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: KColors.primaryColor,
                width: 1.5,
              ),
            ),
            child: const KText(
              "Link",
              variant: TypographyVariant.h3,
              style: TextStyle(
                color: KColors.primaryColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KText(
          "Social Media",
          variant: TypographyVariant.h1,
          style: TextStyle(color: KColors.primaryColor),
        ),
        const SizedBox(height: 20),
        _buildSocialMediaRowItem("Facebook", KImages.facebookIcon),
        const SizedBox(height: 10),
        _buildSocialMediaRowItem("Instagram", KImages.instagramIcon),
        const SizedBox(height: 10),
        _buildSocialMediaRowItem("Webpage", KImages.webpageIcon),
        const SizedBox(height: 10),
      ],
    );
  }
}
