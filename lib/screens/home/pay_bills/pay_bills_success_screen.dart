import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/bill/bill_service_fee_notifier.dart';
import 'package:unitey_app/core/notifier/otp_validation_notifier.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class PayBillsSuccessScreen extends StatelessWidget {
  const PayBillsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) =>  DateFormat("dd MMM |").add_jm().format(date);
    final otpResponse =
    Provider.of<OTPValidationNotifier>(context, listen: false).getOtpResponse!.result;
    final selectedBills = Provider.of<BillsSelectionNotifier>(context,listen: false);
    final billServiceFee =
    Provider.of<BillServiceFeeNotifier>(context, listen: false).getBillServiceFee!.result!;
    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FD),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //AppBar
                  Container(
                    height: 49.h,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: AppPadding.p8),
                              child: SvgPicture.asset(ImageAssets.leftArrowIc),
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                        ),
                        Text(
                          "Recharge\n${selectedBills.getBillerNumber}",
                          textAlign: TextAlign.center,
                          style: getRegularStyle(
                              color: CupertinoColors.black,
                              fontSize: FontSize.s14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 128.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        vertical: AppPadding.p9.h,
                        horizontal: AppPadding.p16.w),
                    padding: EdgeInsets.fromLTRB(AppPadding.p16.w,
                        AppPadding.p12.h, AppPadding.p10.w, AppPadding.p12.h),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Recharge Successful!\n",
                                style: getSemiBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16),
                              ),
                              TextSpan(
                                text: "${billServiceFee.totalAmount?.toStringAsFixed(2)} AED",
                                style: getBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s20,
                                ),
                              )
                            ])),
                            SvgPicture.asset(ImageAssets.billsSuccessIc)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Reference No:\n",
                                style:
                                    getRegularStyle(color: ColorManager.black3),
                              ),
                              TextSpan(
                                text: otpResponse!.referenceNumber,
                                style: getRegularStyle(
                                    color: ColorManager.black3,
                                    fontSize: FontSize.s14),
                              )
                            ])),
                            Text("\n${formatDate(otpResponse.updatedAt.toLocal())}",
                                style:
                                    getRegularStyle(color: ColorManager.grey))
                            // Text("\n${otpResponse.updatedAt.day} ${otpResponse.updatedAt.month} | 10:00 AM",
                            //     style:
                            //         getRegularStyle(color: ColorManager.grey))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p34.w),
                    child: Text(
                      "You have 130 points remaining. Use it in the next shopping.",
                      style: getRegularStyle(color: ColorManager.grey),
                    ),
                  ),
                  kSizedBox18,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(ImageAssets.billsShareIc),
                          kSizedW10,
                          Text(
                            "Share",
                            style: getSemiBoldStyle(
                                color: ColorManager.quaternary,
                                fontSize: FontSize.s14),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(ImageAssets.downloadIc),
                          kSizedW10,
                          Text(
                            "Download Receipt",
                            style: getSemiBoldStyle(
                                color: ColorManager.quaternary,
                                fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    ],
                  ),
                  kSizedBox14,
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p32.w,
                              vertical: AppPadding.p10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Rewards",
                                style: getSemiBoldStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16),
                              ),
                              Text(
                                "View All",
                                style: getBoldStyle(
                                        color: ColorManager.tertiary,
                                        fontSize: FontSize.s14)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 164.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding:  EdgeInsets.only(left: AppPadding.p32.w),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 164.h,
                                  width: 138.11.w,
                                  margin: EdgeInsets.only(right: AppMargin.m8),
                                  padding:EdgeInsets.only(bottom: AppPadding.p22.h) ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(ImageAssets.rewardBg),
                                          fit: BoxFit.cover)),
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Unlock Before\n15 April 2022",
                                      textAlign: TextAlign.center,
                                      style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s10),)),
                                );
                              }),
                        ),
                        kSizedBox42,
                        CustomButton(onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, mainRoute, (route) => false);
                        }, width: 169.w, text: "Back to Home")
                      ],
                    ),
                  )
                ],
              ),
              //Background Image
              Positioned(
                  bottom: 0, right: 0, child: Image.asset(ImageAssets.billsBg),),
              //Todo: Uncomment when the notification functionality added
              // Positioned(
              //   bottom: 65.h,
              //   right: 0,
              //   left: 0,
              //   child: Container(
              //       height: 50.h,
              //       width: double.infinity,
              //       color: ColorManager.white,
              //       padding: EdgeInsets.only(left: AppPadding.p18),
              //       child: Row(
              //
              //           children: [
              //             SvgPicture.asset(ImageAssets.jackpotSuccessIc),
              //             kSizedW15,
              //             RichText(text: TextSpan(
              //               style: getRegularStyle(color: ColorManager.black,),
              //               children:[
              //                 TextSpan(
              //                     text: "Pay"
              //                 ),
              //                 TextSpan(
              //                     text: " 5 more ",
              //                     style: getSemiBoldStyle(color: ColorManager.black,)
              //                 ),
              //                 TextSpan(
              //                     text: "bills and win the jackpot"
              //                 ),
              //               ],
              //             )),
              //             Spacer(),
              //             IconButton(
              //               onPressed: (){},
              //               icon: Icon(Icons.close_rounded,
              //                 size: 16,),
              //             )])
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
