import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';

import '../../../../../constant/api_const/app_api.dart';
import '../../../../../constant/values_manger.dart';
import '../../../../../core/notifier/remittance/exchange_house_list_provider.dart';
import '../../../../../core/notifier/remittance/fee_calculation_notifier.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../provider/beneficiary_select_notifier.dart';
import '../../../../../widgets/circular_indicator_widget.dart';
import '../../../../../widgets/biller_image_widget.dart';

class SelectedExchangeHouseWidget extends StatelessWidget {
  const SelectedExchangeHouseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feeCalculation = Provider.of<FeeCalculationNotifier>(context, listen: false);
    final selectedBeneficiary =
    Provider.of<BeneficiarySelectNotifier>(context, listen: true);
    return Consumer<ExchangeHouseListNotifier>(
        builder: (context, snapshot, child) {
          return snapshot.isLoading == true
              ? const CircularIndicatorWidget()
              : (snapshot.getIsResultIsEmpty == true || snapshot.errorMessage != null)
              ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                snapshot.errorMessage ?? "exchanges house data couldn't be loaded",
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14),
              ),
            ),
          )
              : DottedBorder(
            color: ColorManager.quaternary,
            strokeWidth: 2,
            dashPattern: const [10, 10],
            borderType: BorderType.RRect,
            radius: const Radius.circular(15),
            child: Container(
              padding:  EdgeInsets.fromLTRB(AppPadding.p13.w,
                  AppPadding.p10.w, AppPadding.p12.w, AppPadding.p10.w),
              width: double.infinity,
              height: 106.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Conversion Rate",
                        style: getRegularStyle(color: ColorManager.grey),
                      ),
                      Text("Transfer Fee",
                          style:
                          getRegularStyle(color: ColorManager.grey)),
                    ],
                  ),
                  kSizedBox2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.getExchangeHouseModel?.result?.isNotEmpty == true &&
                        snapshot.getExchangeHouseModel!.result![0].products?.isNotEmpty == true &&
                        snapshot.getExchangeHouseModel!.result![0].products![0].fee != null
                        ? "1 ${snapshot.getExchangeHouseModel!.result![0].products![0].fee!.fromCurrency ?? selectedBeneficiary.getFromCountry ?? "AED"} = ${snapshot.getExchangeHouseModel!.result![0].products![0].fee!.fxRate ?? "0.00"} ${snapshot.getExchangeHouseModel!.result![0].products![0].fee!.toCurrency ?? selectedBeneficiary.getToCountry ?? "INR"}"
                        : "1 ${selectedBeneficiary.getFromCountry ?? "AED"} = 0.00 ${selectedBeneficiary.getToCountry ?? "INR"}",
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14),
                      ),
                      feeCalculation.getIsLoading? const
                      CupertinoActivityIndicator(): Text(
                        "${selectedBeneficiary.getTransferFee.toStringAsFixed(2)} ${selectedBeneficiary.getFromCountry??"AED"}",
                        style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14),
                      )
                    ],
                  ),
                  kSizedBox2,
                  Divider(
                    color: ColorManager.quaternary,
                    height: 3,
                  ),
                  kSizedBox2,
                  Flexible(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: BillerImage(
                            imageKey: (snapshot.getExchangeHouseModel?.result?.isNotEmpty == true &&
                                snapshot.getExchangeHouseModel!.result![0].products?.isNotEmpty == true)
                                ? snapshot.getExchangeHouseModel!.result![0].products![0].logo
                                : null,
                            height: 30.w,
                            width: 30.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        kSizedW10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.getExchangeHouseModel?.result?.isNotEmpty == true &&
                              snapshot.getExchangeHouseModel!.result![0].products?.isNotEmpty == true &&
                              snapshot.getExchangeHouseModel!.result![0].products![0].name?.isNotEmpty == true
                              ? snapshot.getExchangeHouseModel!.result![0].products![0].name!
                              : "Exchange House",
                              style: getRegularStyle(
                                  color: ColorManager.grey),
                            ),
                            Text(
                              "★ 4.5 🕒 2 days",
                              style: getRegularStyle(
                                  color: ColorManager.secondaryDark),
                            ),
                          ],
                        ),
                        const Spacer(),
                        OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: ColorManager.black)))),
                            onPressed: () {},
                            child: Text("Change",
                                style: getRegularStyle(
                                    color: ColorManager.grey)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
