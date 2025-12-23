
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/values_manger.dart';

import '../../../../../constant/font_manager.dart';
import '../../../../../constant/style_manager.dart';


class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
    required this.text,
    required this.subText,
    this.style
  }) : super(key: key);
 final String text;
 final String subText;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:AppPadding.p18.w, right: AppPadding.p28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "$text\n",
                    style: getRegularStyle(color:const  Color(0xFFA262A5),fontSize: FontSize.s14)),
                TextSpan(
                    text: subText,
                    style:style?? getBoldStyle(color: const Color(0xFFF4B277),fontSize: FontSize.s28,)),
              ])),
          Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
        ],
      ),
    );
  }
}