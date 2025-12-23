import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import '../../../constant/asset_manager.dart';
import 'bank_screen.dart';

class AddBeneficiaryScreen extends StatefulWidget {
  const AddBeneficiaryScreen({Key? key}) : super(key: key);

  @override
  State<AddBeneficiaryScreen> createState() => _AddBeneficiaryScreenState();
}

class _AddBeneficiaryScreenState extends State<AddBeneficiaryScreen> {
  //Todo: Change the stateful widget and the logic whenever you get time
  bool isBank = false, isWallet = false, isCash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                ImageAssets.bg,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top+65.h,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: AppPadding.p13.h),

                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close_rounded,
                          color: ColorManager.white,
                        )),
                    RichText(
                      text: TextSpan(
                          text: "Add Beneficiary\n",
                          style: getSemiBoldStyle(
                              color: ColorManager.white, fontSize: FontSize.s16),
                          children: [
                            TextSpan(
                                text: "International Account",
                                style: getRegularStyle(color: ColorManager.white))
                          ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p18, vertical: AppPadding.p20),
                child: Text(
                  "How do you wish to add money to your\nbeneficiary",
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  children: [
                    InkWell(
                      onTap:(){
                        setState((){
                          isBank=!isBank;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const BankScreen()));
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                        height: 54.h,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: AppMargin.m18),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: isBank
                                    ? ColorManager.primary
                                    : ColorManager.grey4),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            kSizedW10,
                            Container(
                              height: 22.w,
                              width: 22.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isBank
                                      ? ColorManager.primary
                                      : ColorManager.white,
                                  border: Border.all(color: ColorManager.grey4)),
                              child: isBank
                                  ? Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            kSizedW15,
                            Text(
                              "Bank Account",
                              style: isBank
                                  ? getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSize.s14)
                                  : getRegularStyle(
                                      color: ColorManager.black3,
                                      fontSize: FontSize.s14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 54.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: AppMargin.m18),
                      decoration: BoxDecoration(
                          border: Border.all(color: isWallet
                              ? ColorManager.primary
                              : ColorManager.grey4),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          kSizedW10,
                          Container(
                            height: 22.w,
                            width: 22.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              border: Border.all(color: isWallet
                                  ? ColorManager.primary
                                  : ColorManager.grey4),
                                color: isWallet
                                    ? ColorManager.primary
                                    : ColorManager.white,),
                            child:isWallet
                                ? Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          kSizedW15,
                          Text(
                            "Wallet",
                            style: isWallet
                                ? getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14)
                                : getRegularStyle(
                                color: ColorManager.black3,
                                fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 54.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: AppMargin.m18),
                      decoration: BoxDecoration(
                          border: Border.all(color: isCash
                              ? ColorManager.primary
                              : ColorManager.grey4),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          kSizedW10,
                          Container(
                            height: 22.w,
                            width: 22.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: isCash
                                    ? ColorManager.primary
                                    : ColorManager.grey4),
                                color: isCash
                                    ? ColorManager.primary
                                    : ColorManager.white,),
                            child: isCash
                                ? Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          kSizedW15,
                          Text(
                            "Cash",
                            style: isCash
                                ? getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14)
                                : getRegularStyle(
                                color: ColorManager.black3,
                                fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
