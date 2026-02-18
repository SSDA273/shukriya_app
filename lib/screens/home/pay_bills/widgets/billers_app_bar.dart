import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';

import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../provider/biller_select_notifier.dart';
import '../../../../widgets/biller_image_widget.dart';

class BillersAppBar extends StatelessWidget {
  const BillersAppBar({
    Key? key,
    this.type
  }) : super(key: key);
  final String? type;

  @override
  Widget build(BuildContext context) {
    final selectedBillerNotifier =
    Provider.of<BillsSelectionNotifier>(context, listen: false);
    return Container(
      height: 145.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric( horizontal: AppPadding.p16.w),

      padding:const EdgeInsets.symmetric(vertical: AppPadding.p20),
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: ()=>Navigator.pop(context),
                  child: SvgPicture.asset(ImageAssets.leftArrowIc)),
              kSizedW10, Text("Mobile Recharge",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.black)),
            ],
          ),
          kSizedBox25,
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BillerImage(
                  imageKey: type == "newBills" ? selectedBillerNotifier.getBillLogo : selectedBillerNotifier.getBillerLogo!,
                  height: 45.w,
                  width: 45.w,
                  fit: BoxFit.cover,
                ),
              ),
              kSizedW15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedBillerNotifier.getBillerName!,
                    style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),),
                  RichText(
                      text: TextSpan(
                          style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s20),
                          children: [
                            TextSpan(text: selectedBillerNotifier.getBillerNumber),
                            TextSpan(text: "  ${type=="newBills"?selectedBillerNotifier.getBillName:selectedBillerNotifier.getBillerProviderName}",
                                style: getRegularStyle(color: ColorManager.grey2)),

                          ]
                      )),
                  // Text("${selectedBillerNotifier.getBillAmount} AED",//Todo:Ask to Nihad.
                  //   style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s14),)
                ],
              )
            ],
          ),
          // Text(
          //   "Enter phone Number",
          //   style: getRegularStyle(
          //       color: ColorManager.grey3, fontSize: FontSize.s14),
          // ),
          // kSizedBox5,
          // Container(
          //   height: 45.h,
          //   width: double.infinity,
          //   padding: EdgeInsets.only(
          //       left: AppPadding.p10.w, top: AppPadding.p10.h),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       border: Border.all(color: ColorManager.grey5)),
          //   child: Text(
          //     selectedBillerNotifier.getBillerNumber!,
          //     style: getSemiBoldStyle(
          //         color: ColorManager.black, fontSize: FontSize.s16),
          //   ),
          // ),
        ],
      ),
    );
  }
}
