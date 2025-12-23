import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/screens/home/pay_beneficiary/beneficiary_success_screen.dart';
import 'package:unitey_app/screens/home/pay_beneficiary/widgets/animated_swipe_button.dart';
import 'package:unitey_app/screens/home/pay_beneficiary/widgets/beneficiary_details_appBar.dart';
import 'package:unitey_app/screens/home/pay_beneficiary/widgets/selected_beneficiary_widget.dart';
import 'package:unitey_app/screens/home/pay_beneficiary/widgets/selected_exchange_widget.dart';
import 'package:unitey_app/screens/home/widgets/custom_otp_screen.dart';
import 'package:unitey_app/widgets/small_card_widget.dart';
import '../../../constant/asset_manager.dart';
import '../../../constant/color_manger.dart';
import '../../../constant/constants.dart';
import '../../../constant/font_manager.dart';
import '../../../constant/style_manager.dart';
import '../../../core/notifier/beneficiary/pay_remittance_notifier.dart';
import '../../../core/notifier/entity_info_notifier.dart';
import '../../../core/notifier/otp_generate_notifier.dart';
import '../../../generated/l10n.dart';
import '../../../provider/beneficiary_select_notifier.dart';

class BeneficiaryDetailsScreen extends StatelessWidget {
  const BeneficiaryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary =
        Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    final entityInfoNotifier =
        Provider.of<EntityInfoNotifier>(context, listen: false);
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    final payRemittance =
        Provider.of<PayRemittanceNotifier>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BeneficiaryDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p2.w, top: AppPadding.p6.h),
                    child: Text(
                      S.of(context).fromAccount,
                      style: getBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s14),
                    ),
                  ),
                  kSizedBox8,
                  const SmallCardWidget(
                    height: 80,
                  ),
                  kSizedBox12,
                  //Exchange House details
                  const SelectedExchangeWidget(),
                  kSizedBox14,
                  //beneficiary details
                  const SelectedBeneficiaryWidget(),
                  kSizedBox16,
                  AnimatedSwipeToConfirm(
                    onConfirm: () => confirmTransfer(
                        entityInfoNotifier: entityInfoNotifier,
                        payRemittance: payRemittance,
                        selectedBeneficiary: selectedBeneficiary,
                        otpGenerateNotifier: otpGenerateNotifier,
                        context: context),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> confirmTransfer(
      {required BeneficiarySelectNotifier selectedBeneficiary,
      required OTPGenerateNotifier otpGenerateNotifier,
      required EntityInfoNotifier entityInfoNotifier,
      required BuildContext context,
      required PayRemittanceNotifier payRemittance}) async {
    await payRemittance
        .payRemittance(
            totalFee: selectedBeneficiary.getTransferFee.toDouble(),
            exchangeRate: selectedBeneficiary.getExchangeRate.toDouble(),
            creditAmountCurrency: selectedBeneficiary.getToCountry ?? "INR",
            creditAmount: selectedBeneficiary.getReceiveAmount.toDouble(),
            serviceId: selectedBeneficiary.getServiceID.toString(),
            feeFxId: selectedBeneficiary.getFeeFxID.toString(),
            notes: selectedBeneficiary.getNotes,
            context: context,
            beneficiaryId: selectedBeneficiary.getBeneficiaryId.toString(),
            amount: selectedBeneficiary.getSendAmount.toDouble(),
            debitCurrency:
                entityInfoNotifier.getEntityInfoModel?.result?.homeCurrency ??
                    "",
            narrative: "",
            purpose: "",
            source: "")
        .then((value) async {
      if (value!.statusCode == 200) {
        await otpGenerateNotifier
            .generateOTP(
                context: context, transactionId: value.result!.referenceNumber)
            .then((_) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomOTPScreen(
                        transactionId: value.result!.referenceNumber,
                        bgImage: ImageAssets.bg,
                        nextScreen: const BeneficiarySuccessScreen(),
                      )));
        });
      }
    });
  }
}
