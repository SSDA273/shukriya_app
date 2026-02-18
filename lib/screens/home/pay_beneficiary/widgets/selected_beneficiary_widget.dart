import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constant/api_const/app_api.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../provider/beneficiary_select_notifier.dart';
import '../../../../constant/asset_manager.dart';
import '../../../../widgets/biller_image_widget.dart';

class SelectedBeneficiaryWidget extends StatelessWidget {
  const SelectedBeneficiaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary =
    Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "To ${selectedBeneficiary.getBeneficiaryNickName}",
              style: getBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.s14),
            ),
            Text(
              "See full details",
              style: getBoldStyle(
                color: ColorManager.quaternary,
              ).copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
        kSizedBox8,
        Container(
          height: 84.h,
          padding:const EdgeInsets.only(
              left: AppPadding.p12,
              top: AppPadding.p12,
              bottom: AppPadding.p12),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFBF7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:const Color(0xFFFEC390),
              )),
          child: Row(
            children: [
              ClipOval(
                child: BillerImage(
                  imageKey: selectedBeneficiary.getBeneficiaryImage,
                  fallbackAsset: ImageAssets.profile,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              kSizedW15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${selectedBeneficiary.getBeneficiaryName}",
                    style: getBoldStyle(
                        color: ColorManager.secondaryDark,
                        fontSize: FontSize.s14),
                  ),
                  RichText(
                      text: TextSpan(
                          style: getRegularStyle(
                              color: ColorManager.grey4,
                              fontSize: FontSize.s14),
                          children: [
                            TextSpan(text: "Bank :  "),
                            TextSpan(
                                text:
                                "${selectedBeneficiary.getBeneficiaryBankName}",
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14))
                          ])),
                  RichText(
                      text: TextSpan(
                          style: getRegularStyle(
                              color: ColorManager.grey4,
                              fontSize: FontSize.s14),
                          children: [
                            TextSpan(text: "Account No :  "),
                            TextSpan(
                                text:
                                "${selectedBeneficiary.getBeneficiaryAccountNumber}",
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14))
                          ])),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}