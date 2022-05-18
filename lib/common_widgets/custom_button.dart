import 'package:flutter/material.dart';
import 'package:flutter_app_klass/themes/themes.dart';


///`KButton` is a custom button of type [ElevatedButton]
class KButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsets padding;
  final Color buttonColor;
  final double? radius;
  final Color? borderColor;

  const KButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 18.0,
      horizontal: 18.0,
    ),
    this.buttonColor = KColors.primaryColor,
    this.radius,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            side: BorderSide(
                color: borderColor ?? KColors.primaryColor, width: 1.2),
          ),
        ),
        alignment: Alignment.center,
      ),
      child: child,
    );
  }
}
