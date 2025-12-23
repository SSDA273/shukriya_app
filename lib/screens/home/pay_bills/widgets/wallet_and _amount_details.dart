import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/bill/bill_service_fee_notifier.dart';
import 'package:unitey_app/core/notifier/billers/pay_bill_notifier.dart';
import 'package:unitey_app/core/notifier/entity_info_notifier.dart';
import 'package:unitey_app/core/notifier/otp_generate_notifier.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/screens/home/pay_bills/pay_bills_success_screen.dart';
import 'package:unitey_app/screens/home/widgets/custom_otp_screen.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import 'package:unitey_app/widgets/custom_button.dart';

class WalletAndAmountDetails extends StatefulWidget {
  const WalletAndAmountDetails({Key? key, this.type}) : super(key: key);
  final String? type;

  @override
  State<WalletAndAmountDetails> createState() => _WalletAndAmountDetailsState();
}

class _WalletAndAmountDetailsState extends State<WalletAndAmountDetails> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final selectBillNotifier =
        Provider.of<BillsSelectionNotifier>(context, listen: false);
    final payBill = Provider.of<PayBillNotifier>(context, listen: false);
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    final entityInfoNotifier =
        Provider.of<EntityInfoNotifier>(context, listen: false);
    final billServiceFee =
        Provider.of<BillServiceFeeNotifier>(context, listen: false);
    return Container(
      width: double.infinity,
      color: ColorManager.white,
      margin: EdgeInsets.only(top: AppMargin.m8),
      padding: EdgeInsets.only(top: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Wallet Points
          Container(
            height: 34.h,
            width: double.infinity,
            color: Color(0xFFFFF3E9),
            padding:
                EdgeInsets.only(left: AppPadding.p14, right: AppPadding.p18),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: ColorManager.secondaryDark,
                ),
                kSizedW7,
                Text(
                  "Use shukria wallet points",
                  style: getRegularStyle(color: ColorManager.secondaryDark),
                ),
                Spacer(),
                RichText(
                    text: TextSpan(
                        style: getBoldStyle(
                            color: ColorManager.secondaryDark,
                            fontSize: FontSize.s16),
                        children: [
                      TextSpan(text: "0"),
                      TextSpan(
                          text: " Points",
                          style: getRegularStyle(color: ColorManager.black)),
                    ])),
              ],
            ),
          ),
          kSizedBox24,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Prepaid Recharge Details",
                  style: getSemiBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s16),
                ),
                kSizedBox8,
                Row(
                  children: [
                    Text(
                      "Recharge Amount",
                      style: getRegularStyle(
                          color: ColorManager.grey3, fontSize: FontSize.s14),
                    ),
                    kSizedW7,
                    Text(
                      "(inclusive of VAT ):",
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s10),
                    ),
                    Spacer(),
                    Text(
                      "${selectBillNotifier.getBillAmount} AED",
                      style: getBoldStyle(
                          color: ColorManager.black3, fontSize: FontSize.s16),
                    )
                  ],
                ),
                kSizedBox15,
                Row(
                  children: [
                    Text(
                      "Wallet Points:",
                      style: getRegularStyle(
                          color: ColorManager.grey3, fontSize: FontSize.s14),
                    ),
                    Spacer(),
                    Text(
                      "0 AED",
                      style: getBoldStyle(
                          color: ColorManager.secondaryDark,
                          fontSize: FontSize.s16),
                    )
                  ],
                ),
                kSizedBox15,
                Row(
                  children: [
                    Text(
                      "Service fee:",
                      style: getRegularStyle(
                          color: ColorManager.grey3, fontSize: FontSize.s14),
                    ),
                    Spacer(),
                    Text(
                      "${billServiceFee.getBillServiceFee!.result!.totalFee == 0 || billServiceFee.getBillServiceFee!.result!.totalFee == null ? "0" : amountFormatter.format(billServiceFee.getBillServiceFee!.result!.totalFee)} AED",
                      style: getRegularStyle(
                          color: ColorManager.black3, fontSize: FontSize.s16),
                    )
                  ],
                ),
                kSizedBox15,
                Row(
                  children: [
                    Text(
                      "Payable Amount:",
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    ),
                    const Spacer(),
                    Text(
                      amountFormatter.format(billServiceFee
                          .getBillServiceFee!.result!.totalAmount),
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                    Text(
                      " AED",
                      style: getRegularStyle(
                          color: ColorManager.black3, fontSize: FontSize.s16),
                    ),
                  ],
                ),
                kSizedBox22,
                _isLoading
                    ? const CircularIndicatorWidget()
                    : Center(
                        child: CustomButton(
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await payBill
                                  .payBill(
                                      feeStructure: billServiceFee
                                          .getBillServiceFee!
                                          .result!
                                          .feeStructure,
                                      debitAmountCurrency: entityInfoNotifier
                                              .getEntityInfoModel
                                              ?.result
                                              ?.homeCurrency ??
                                          "",
                                      serviceId: widget.type == "newBills"
                                          ? selectBillNotifier.getBillServiceId!
                                          : selectBillNotifier
                                              .getBillerServiceId!,
                                      billerId: widget.type == "newBills"
                                          ? selectBillNotifier.getBillId
                                          : selectBillNotifier.getBillerId!,
                                      context: context,
                                      billAmount: double.parse(
                                          selectBillNotifier.getBillAmount
                                              .toString()),
                                      billNotes: "")
                                  .then((value) async {
                                if (value!.statusCode == 200) {
                                  await otpGenerateNotifier.generateOTP(
                                      context: context,
                                      transactionId:
                                          value.result!.referenceNumber);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CustomOTPScreen(
                                              transactionId:
                                                  value.result!.referenceNumber,
                                              bgImage: ImageAssets.billsBg,
                                              nextScreen:
                                                  const PayBillsSuccessScreen(),
                                            )),
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              });

                              setState(() {
                                _isLoading = false;
                              });
                            },
                            width: 169,
                            text: "Recharge Now")),
                kSizedBox20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
