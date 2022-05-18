import 'package:flutter/material.dart';
import 'package:flutter_app_klass/themes/themes.dart';


import 'custom_text.dart';
export 'package:flutter_app_klass/common_widgets/custom_text.dart';
//export 'package:klass/Constants/KColors.dart';

class KIconButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Widget icon;
  final EdgeInsets padding;
  final Color buttonColor;
  final double? radius;
  final Color? borderColor;

  const KIconButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      vertical: 13.0,
      horizontal: 13.0,
    ),
    this.buttonColor = KColors.greyButtonColor,
    this.radius,
    this.borderColor = KColors.greyButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            side: BorderSide(
                color: borderColor ?? KColors.greyButtonColor, width: 1.2),
          ),
        ),
        alignment: Alignment.center,
      ),
      label: KText(
        label,
        variant: TypographyVariant.h1,
      ),
    );
  }
}
