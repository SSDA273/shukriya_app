import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

class BillsDetailsAppBar extends StatelessWidget {
  const BillsDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.w, vertical: AppPadding.p10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p2),
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              )),
          kSizedW10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mobile Recharge",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.black)),
              Text("Details of the transaction",
                  style: getRegularStyle(color: ColorManager.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
