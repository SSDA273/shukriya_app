import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';

import '../../../constant/api_const/app_api.dart';
import '../../../constant/app_routes.dart';
import '../../../constant/asset_manager.dart';
import '../../../core/notifier/otp_validation_notifier.dart';
import '../../../provider/beneficiary_select_notifier.dart';
import '../../../widgets/custom_button.dart';

class BeneficiarySuccessScreen extends StatefulWidget {
  const BeneficiarySuccessScreen({Key? key}) : super(key: key);

  @override
  State<BeneficiarySuccessScreen> createState() => _BeneficiarySuccessScreenState();
}

class _BeneficiarySuccessScreenState extends State<BeneficiarySuccessScreen> {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> _shareReceipt() async {
    try {
      final image = await screenshotController.capture();
      if (image != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = await File('${directory.path}/receipt.png').create();
        await imagePath.writeAsBytes(image);
        await Share.shareXFiles([XFile(imagePath.path)], text: 'Transaction Receipt');
      }
    } catch (e) {
      debugPrint("Error sharing receipt: $e");
    }
  }

  Future<void> _downloadReceipt() async {
    try {
      final image = await screenshotController.capture();
      if (image != null) {
        // Since saving to gallery requires extra permissions/plugins, 
        // we'll save to documents and show a success message for the demo.
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/receipt_${DateTime.now().millisecondsSinceEpoch}.png').create();
        await imagePath.writeAsBytes(image);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Receipt downloaded successfully!')),
        );
      }
    } catch (e) {
      debugPrint("Error downloading receipt: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading receipt: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final otpResponse =
        Provider.of<OTPValidationNotifier>(context, listen: false);
    final selectedBeneficiary =
        Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /
                2, //Todo:Change after get prefect Original height
            decoration: const BoxDecoration(
              color: Color(0xff2f1733),
            ),
          ),
          //Top Frame
          Positioned(
            top: 170.h,
            left: 285.w,
            // top: 160,
            // left: 213,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                ImageAssets.homeBgFrame,
                height: 170.h,
                // width: 105,
                // height: 147,
                // color: Color.fromRGBO(38, 38, 38, 0.4),
                // color:const Color(0xffFD5BAA),
              ),
            ),
          ),
          //bottom Frame
          Positioned(
            top: 485.h,
            left: 255.w,
            // top: 160,
            // left: 213,
            child: SvgPicture.asset(
              ImageAssets.homeBgFrame,
              height: 200.h,
              // width: 105,
              // height: 147,
              // color: Color.fromRGBO(38, 38, 38, 0.4),
              // color:const Color(0xffFD5BAA),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kSizedBox12,
                    CircleAvatar(
                      backgroundColor: ColorManager.tertiary,
                      radius: 35.r,
                      child: CircleAvatar(
                        radius: 33.r,
                        backgroundColor: ColorManager.tertiary,
                        backgroundImage: NetworkImage(
                            "${AppAPI.baseUrl}/files?key=${selectedBeneficiary.getBeneficiaryImage}"),
                      ),
                    ),
                    kSizedBox20,
                    Text(
                      "Congratulations!",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    kSizedBox5,
                    Text(
                      "Amount successfully initiated to",
                      style: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSize.s14),
                    ),
                    kSizedBox8,
                    Text(
                      selectedBeneficiary.getBeneficiaryName.toString(),
                      style: getBoldStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s14),
                    ),
                    kSizedBox50,
                    Screenshot(
                      controller: screenshotController,
                      child: Container(
                        height: 254.h,
                        width: 288.w,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFA6A6A6).withOpacity(0.15),
                              // color: ColorManager.black,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageAssets.successIc,
                                height: 25.h,
                              ),
                              kSizedW7,
                              Text(
                                "Paid ${amountFormatter.format(selectedBeneficiary.getReceiveAmount)} ${selectedBeneficiary.getToCountry ?? "INR"}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.black),
                              )
                            ],
                          ),
                          kSizedBox2,
                          Text(
                            "Today at ${otpResponse.getOtpResponse?.result?.updatedAt != null ? timeFormatter.format(otpResponse.getOtpResponse!.result!.updatedAt) : 'Just now'}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          kSizedBox32,
                          Text(
                            "Transaction No",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ColorManager.black),
                          ),
                          kSizedBox2,
                          Text(
                            otpResponse.getOtpResponse?.result?.referenceNumber ?? "N/A",
                            style: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s16),
                          ),
                          kSizedBox42,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: _shareReceipt,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageAssets.shareIc,
                                      height: 22.h,
                                    ),
                                    kSizedW5,
                                    Text(
                                      "Share",
                                      style: getSemiBoldStyle(
                                          color: ColorManager.quaternary,
                                          fontSize: FontSize.s16),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: _downloadReceipt,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageAssets.downloadIc,
                                      height: 22.h,
                                    ),
                                    kSizedW5,
                                    Text(
                                      "Download",
                                      style: getSemiBoldStyle(
                                          color: ColorManager.quaternary,
                                          fontSize: FontSize.s16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                  ),
                    ),
                    kSizedBox22,
                    Text(
                      "Set reminder to send money every month",
                      style: getSemiBoldStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s14)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    kSizedBox16,
                    CustomButton(
                      width:  161,
                      onTap: () async {
                        selectedBeneficiary.setBeneficiaryId = "deSelected";
                        Navigator.pushNamedAndRemoveUntil(
                            context, mainRoute, (route) => false);
                      },
                      text: "Go back to home",
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
