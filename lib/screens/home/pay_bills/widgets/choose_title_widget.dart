import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';

class ChooseTitleWidget extends StatelessWidget {
  const ChooseTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppPadding.p12,horizontal: AppPadding.p16),
      color: const Color(0xFFF8F9FD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose recharge amount",
            style: getSemiBoldStyle(
                color: ColorManager.black3, fontSize: FontSize.s16),
          ),
          kSizedBox5,
          Text(
            "(Inclusive 5%VAT)",
            style: getRegularStyle(color: ColorManager.grey2),
          ),
        ],
      ),
    );
  }
}
