import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constant/api_const/app_api.dart';
import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../provider/beneficiary_select_notifier.dart';

class SelectedExchangeWidget extends StatelessWidget {
  const SelectedExchangeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary =
        Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    return Container(
      height: 94.h,
      padding: EdgeInsets.only(
          top: AppPadding.p8.h,
          left: AppPadding.p12.w,
          right: AppPadding.p12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.grey5,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30.w,
                width: 30.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEFEFEF)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${AppAPI.baseUrl}/files?key=${selectedBeneficiary.getExchangeHouseLogo!}")),
                    shape: BoxShape.circle),
              ),
              kSizedW6,
              Text(
                selectedBeneficiary.getExchangeHouseName!,
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
            ],
          ),
          kSizedBox5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Transfer Fee",
                    style: getRegularStyle(color: ColorManager.grey2),
                  ),
                  kSizedBox5,
                  Container(
                    height: 22.h,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                    decoration: BoxDecoration(
                        color: Color(0xFFFBF5FC),
                        border:
                            Border.all(color: ColorManager.grey4, width: 0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.sendIc,
                        ),
                        kSizedW5,
                        Text(
                          "${selectedBeneficiary.getTransferFee} ${selectedBeneficiary.getFromCountry ?? "AED"} ",
                          style: getSemiBoldStyle(color: ColorManager.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Time Taken",
                    style: getRegularStyle(color: ColorManager.grey2),
                  ),
                  kSizedBox5,
                  Container(
                    height: 22.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                        color: Color(0xFFFBF5FC),
                        border:
                            Border.all(color: ColorManager.grey4, width: 0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.clockIc,
                        ),
                        Text(
                          "2 days",
                          style: getSemiBoldStyle(
                            color: ColorManager.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Conversion Rate",
                    style: getRegularStyle(color: ColorManager.grey2),
                  ),
                  kSizedBox5,
                  Container(
                    height: 22.h,
                    width: 118.w,
                    decoration: BoxDecoration(
                        color: Color(0xFFFBF5FC),
                        border:
                            Border.all(color: ColorManager.grey4, width: 0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "(1 ${selectedBeneficiary.getFromCountry ?? "AED"} = ${selectedBeneficiary.getExchangeRate} ${selectedBeneficiary.getToCountry ?? "INR"})",
                            style: getSemiBoldStyle(
                              color: ColorManager.black,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
