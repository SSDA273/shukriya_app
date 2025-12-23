import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/color_manger.dart';
import '../constant/font_manager.dart';
import '../constant/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
  required this.onTap,
    required this.width,
  required this.text}) : super(key: key);
  final void Function()? onTap;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46.h,
        width:width.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF7B3884),
              Color(0xffC34BD4),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(text,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s16)),
        ),
      ),
    );
  }
}
