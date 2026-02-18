import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/notifier/colors_notifier/colors_notifier.dart';
import 'package:unitey_app/extension/color_extension.dart';
import 'package:unitey_app/main.dart';

class ColorManager {
  // --- SPLASH SCREEN COLORS (Preserved as per requirement) ---
  static Color splashPrimary = HexColor.fromHex("#1cd475");
  static Color splashDarkPrimary = HexColor.fromHex("#4A1B5C");

  // --- BRAND COLORS (Light Shades Only) ---
  static Color primary = HexColor.fromHex("#BA68C8"); // Light Purple
  static Color primary1 = primary; // Alias for compatibility
  static Color secondary = HexColor.fromHex("#8BC34A"); // Bright Green (Logo)
  static Color secondaryDark = secondary; // Alias for compatibility
  static Color darkPrimary = HexColor.fromHex("#CE93D8"); // Medium-Light Purple
  static Color quaternary = HexColor.fromHex("#A4D65E"); // Lightened Green
  static Color tertiary = HexColor.fromHex("#F3E5F5"); // Very Light Purple (Backgrounds/Accents)
  
  static Color appBgColor = HexColor.fromHex("#F8F9FD");
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
  static Color brandPurple = HexColor.fromHex("#BA68C8");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color brandGreen = HexColor.fromHex("#8BC34A");
  static Color splashBg = HexColor.fromHex("#F3E5F5");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3BA68C8");
  // new colors
  static Color newActionBadge = HexColor.fromHex("#FF6B00");

  static Color grey2 = HexColor.fromHex("#797979");

  static Color error = HexColor.fromHex("#e61f34");

}
