import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../generated/l10n.dart';
import '../../../../provider/beneficiary_select_notifier.dart';

class BeneficiaryDetailsAppBar extends StatelessWidget {
  const BeneficiaryDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary =
    Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    return Container(
      decoration:  BoxDecoration(
        color: ColorManager.appBgColor,
        borderRadius:const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 108.h,
            left: 234.w,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                ImageAssets.homeBgFrame,
                height: 147.h,
                // width: 105,
                // height: 147,
                // color: Color.fromRGBO(38, 38, 38, 0.4),
                // color:const Color(0xffFD5BAA),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //App Bar Widget
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p6.w),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.adaptive.arrow_back,
                            color: ColorManager.white,
                          )),
                      Flexible(
                        child: Text(
                          S.of(context).confirmTranxMoney,
                          style: getSemiBoldStyle(
                              color: ColorManager.white, fontSize: FontSize.s16),
                        ),
                      )
                    ],
                  ),
                ),
                //Balance Widget
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20.w, top: AppPadding.p12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).youTransferring,
                        style: getRegularStyle(
                          color: const Color(0xFFA262A5),
                          fontSize: FontSize.s14,
                        ),
                      ),
                      Text(
                        "${amountFormatter.format(selectedBeneficiary.getSendAmount)} ${selectedBeneficiary.getFromCountry ?? "AED"}",
                        style: getBoldStyle(
                            color: ColorManager.secondary,
                            fontSize: FontSize.s20),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorManager.primary,
                  thickness: 1,
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${selectedBeneficiary.getBeneficiaryNickName} ${S.of(context).receives}",
                        style: getRegularStyle(
                            color: const Color(0xFFA262A5),
                            fontSize: FontSize.s14),
                      ),
                      RichText(
                          text: TextSpan(
                              style: getBoldStyle(
                                  color: ColorManager.secondary,
                                  fontSize: FontSize.s20),
                              children: [
                                TextSpan(
                                    text:
                                    "${amountFormatter.format(selectedBeneficiary.getReceiveAmount)} ${selectedBeneficiary.getToCountry ?? "INR"}"),
                                TextSpan(
                                    text: "  ${S.of(context).withNextDays}",
                                    style: getRegularStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s14)),
                              ])),
                    ],
                  ),
                ),
                kSizedBox20,
              ],
            ),
          ),
        ],
      ),
    );
  }
}