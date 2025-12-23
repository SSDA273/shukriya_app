import 'package:flutter/material.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

import 'color_manger.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app - Al Razouki branding
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.quaternary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      scaffoldBackgroundColor: ColorManager.white,
      // ripple color
      splashColor: ColorManager.primaryOpacity70,
      // will be used incase of disabled button for example
      // accentColor: ColorManager.grey, // DEPRECATED in Flutter 3.x
      // card view theme
      cardTheme: CardThemeData(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme - Al Razouki branding
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16),
          iconTheme: IconThemeData(color: ColorManager.white)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme - Al Razouki branding
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              backgroundColor: ColorManager.secondary, // Al Razouki green
              foregroundColor: ColorManager.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8)))),

      //Final Design Text theme
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s60),
          displayMedium: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s36),
          displaySmall:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
          headlineMedium: getBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s24),
          headlineSmall:getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s14),
          titleLarge: getBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s20),
          titleMedium: getBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s18),
          titleSmall: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          bodySmall: getRegularStyle(color: ColorManager.grey1), // Changed from caption
          bodyLarge: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      bodyMedium: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s14)),

      // // Text theme
      // textTheme: TextTheme(
      //     headline1: getSemiBoldStyle(
      //         color: ColorManager.black, fontSize: FontSize.s60),
      //     headline2: getRegularStyle(
      //         color: ColorManager.black, fontSize: FontSize.s36),
      //     headline3:
      //         getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
      //     headline4: getRegularStyle(
      //         color: ColorManager.black, fontSize: FontSize.s20),
      //     headline5:getRegularStyle(
      //         color: ColorManager.black, fontSize: FontSize.s14),
      //     headline6: getRegularStyle(
      //     color: ColorManager.black, fontSize: FontSize.s12),
      //     subtitle1: getMediumStyle(
      //         color: ColorManager.black, fontSize: FontSize.s16),
      //     subtitle2: getRegularStyle(
      //         color: ColorManager.black, fontSize: FontSize.s16),
      //     bodyText2: getMediumStyle(color: ColorManager.lightGrey),
      //     caption: getRegularStyle(color: ColorManager.grey1),
      //     bodyText1: getRegularStyle(color: ColorManager.grey)),


      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
