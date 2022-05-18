import 'package:flutter/material.dart';
import 'package:flutter_app_klass/themes/themes.dart';
//import 'package:klass/Constants/KColors.dart';


class KText extends StatelessWidget {
  final String data;
  final TypographyVariant variant;

  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const KText(
    this.data, {
    required this.variant,
    Key? key,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  static TextStyle? styleForVariant(
      BuildContext context, TypographyVariant variant,
      {TextStyle overrides = const TextStyle()}) {
    TextStyle? style;

    switch (variant) {
      case TypographyVariant.title:
        style = const TextStyle(
          color: KColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.titleSmall:
        style = const TextStyle(
          color: KColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.header:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 34,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.headerSmall:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 26,
          height: 1,
          letterSpacing: 0.5,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.h1:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          height: 1.0,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.h2:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.h3:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.h4:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.body:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.button:
        style = const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 18,
          letterSpacing: 0.5,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.bodySmall:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 10,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.bodyLarge:
        style = const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 15,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
    }

    return style.merge(overrides);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        KText.styleForVariant(context, variant)!.merge(this.style);
    return Text(
      data,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      style: style,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      // locale: locale,
      maxLines: maxLines,
      // strutStyle: this.strutStyle,
      // textDirection: this.textDirection,
    );
  }
}

enum TypographyVariant {
  title,
  titleSmall,
  header,
  headerSmall,
  h1,
  h2,
  h3,
  h4,
  body,
  bodyLarge,
  button,
  bodySmall
}
