import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/account_details_notifier.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/widgets/small_card_widget.dart';
import 'package:unitey_app/widgets/biller_image_widget.dart';

class NumberDetailsWidget extends StatelessWidget {
  const NumberDetailsWidget({
    Key? key,
    this.type
  }) : super(key: key);

  final String? type;


  @override
  Widget build(BuildContext context) {
    final selectedBillerNotifier =
    Provider.of<BillsSelectionNotifier>(context, listen: false);

    return Container(
      height: 208.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p14),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BillerImage(
                    imageKey: type == "newBills" ? selectedBillerNotifier.getBillLogo! : selectedBillerNotifier.getBillerLogo!,
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
                              TextSpan(text: "  ${type=="newBills"?selectedBillerNotifier.getBillName!:selectedBillerNotifier.getBillerProviderName}",
                                  style: getRegularStyle(color: ColorManager.grey2)),

                            ]
                        )),
                    Text("${selectedBillerNotifier.getBillAmount} AED",//Todo:Ask to Nihad.
                      style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s14),)
                  ],
                )
              ],
            ),
          ),
          kSizedBox22,
          SmallCardWidget(
            height: 92,
            cardChangeTap: (){},
          ),
        ],
      ),
    );
  }
}
