import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/notifier/colors_notifier/colors_notifier.dart';
import 'package:unitey_app/extension/color_extension.dart';
import 'package:unitey_app/main.dart';

class ColorManager {
  // Al Razouki Exchange Brand Colors - Extracted from logo
  // Primary: Purple from Al Razouki text and bird logo
  // Secondary: Green from Exchange text
  //static Color tertiary = HexColor.fromHex("#4A1B5C");
  static Color primary1 = HexColor.fromHex("#7B3F98");
  static Color secondary = HexColor.fromHex("#8BC34A");
  static Color secondaryDark = HexColor.fromHex("#7CB342");
  static Color quaternary = HexColor.fromHex("#A4D65E");
  //static Color appBgColor = HexColor.fromHex("#2D1B3D");
  static Color primary   = HexColor.fromHex("#1cd475"); // Bright mint green (buttons / accents) 
  static Color tertiary  = HexColor.fromHex("#0E1A12"); // Green-tinted charcoal (headers / cards)
  static Color appBgColor = HexColor.fromHex("#4DBB37"); // Vibrant green (backgrounds)
  static Color red = HexColor.fromHex("#EB5757");
  static Color grey = HexColor.fromHex("#4F4F4F");
  static Color grey1 = HexColor.fromHex("#4F4F4F");
  static Color grey3 = HexColor.fromHex("#828282");
  static Color grey4 = HexColor.fromHex("#BDBDBD");
  static Color grey5 = HexColor.fromHex("#E0E0E0");
  static Color black = HexColor.fromHex("#000000");
  static Color black3 = HexColor.fromHex("#282828");
  static  Color white = HexColor.fromHex("#FFFFFF");
  static  Color backgroundColor = HexColor.fromHex("#F8F9FD");
  static Color filledColor = HexColor.fromHex("#F5F6FA");

  //Al Razouki Brand Colors
  static Color brandPurple = HexColor.fromHex("#7B3F98");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color brandGreen = HexColor.fromHex("#8BC34A");
  static Color splashBg = HexColor.fromHex("#F5F7FA");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B37B3F98");
  // new colors
  static Color darkPrimary = HexColor.fromHex("#4A1B5C");
  static Color newActionBadge = HexColor.fromHex("#FF6B00");

  static Color grey2 = HexColor.fromHex("#797979");

  static Color error = HexColor.fromHex("#e61f34");

}
