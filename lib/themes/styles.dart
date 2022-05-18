import 'package:flutter/material.dart';

import 'colors.dart';


///This file contains all the [TextStyle] that are
///being used in the application

class KStyles {
  KStyles._();

  static const TextStyle lableStyle = TextStyle(
    color: KColors.unselectedColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: 'Roboto',
    height: 1.0,
  );

  static const TextStyle inputText = TextStyle(
    color: KColors.activeTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: 'Roboto',
    height: 1.0,
  );

  static const TextStyle selectedLabelStyle = TextStyle(
    color: KColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    fontFamily: 'Roboto',
    height: 1.5,
  );

  static const TextStyle unSelectedLabelStyle = TextStyle(
    color: KColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    fontFamily: 'Roboto',
    height: 1.5,
  );

  static const IconThemeData selectedIconTheme = IconThemeData(
    color: KColors.primaryColor,
    size: 30,
  );

  static const IconThemeData unSelectedIconTheme = IconThemeData(
    color: KColors.textColor,
    size: 30,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: Color(0xffCCCCCC),
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.0,
    fontFamily: 'Roboto',
  );

  static const TextStyle inFeedTextStyle = TextStyle(
    color: KColors.textColor,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.0,
    fontFamily: 'Roboto',
  );

  static const TextStyle priceTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    fontFamily: 'Roboto',
    height: 1.0,
  );
}
