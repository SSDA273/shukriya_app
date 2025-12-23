import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onPressed, required this.text,this.color})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
          height: 46.h,
          width: 161.w,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF7B3884),
                Color(0xffC34BD4),
              ],
            ),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Center(
              child: Text(
                text,
                style: getSemiBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s16),
              ))),
    );
  }
}
