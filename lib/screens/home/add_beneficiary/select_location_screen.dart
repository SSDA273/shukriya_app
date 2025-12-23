import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/screens/home/main/main_money/main_money_transfer_widget.dart';
import '../../../constant/asset_manager.dart';
import '../../../constant/color_manger.dart';
import '../../../constant/font_manager.dart';
import '../../../constant/style_manager.dart';
import '../../../constant/values_manger.dart';

class SelectTypeScreen extends StatelessWidget {
  const SelectTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  ImageAssets.bg,
                )),
            Column(
              children: [
                kSizedBox10,
                // AppBar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p16),
                        child: SvgPicture.asset(
                          ImageAssets.leftArrowIc,
                        ),
                      ),
                    ),
                    kSizedW10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Beneficiary",
                          style: getSemiBoldStyle(
                              color: ColorManager.black, fontSize: FontSize.s16),
                        ),
                        Text(
                          "Select type",
                          style: getRegularStyle(
                              color: ColorManager.grey1, fontSize: FontSize.s12),
                        ),
                      ],
                    ),
                  ],
                ),
                //Body
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p24, horizontal: AppPadding.p18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p16, horizontal: AppPadding.p16),
                              height: 124.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ColorManager.primary)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: 40.w,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Color(0xFFF9F5F9)),
                                          child: Center(
                                              child: SvgPicture.asset(
                                                  ImageAssets.localIc))),
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: Colors.purple,
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Local\nAccount",
                                    style: getBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 30.h,
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8,vertical: AppPadding.p8),
                              decoration:const BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight:  Radius.circular(8)),
                                  color: Color(0xFFF3F3F3)),
                              child: Row(
                                children: [
                                   Icon(Icons.info,
                                  color: ColorManager.grey2,
                                  size: 16,),
                                  kSizedW5,
                                  Text("Any account within UAE",
                                  style: getRegularStyle(color: ColorManager.grey2,fontSize: FontSize.s10),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSizedW24,
                      Expanded(
                        child: Container(
                          height: 124.h,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p16, horizontal: AppPadding.p16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorManager.grey4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40.w,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFF5F5F5)),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            ImageAssets.internationIc)),
                                  ),
                                  Container(
                                    height: 22.w,
                                    width: 22.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorManager.grey4, width: 1),
                                        shape: BoxShape.circle,
                                        color: ColorManager.white),
                                  ),
                                ],
                              ),
                              Text(
                                "International\nAccount",
                                style: getRegularStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16,horizontal: AppPadding.p30),
                  child: RoundedButtonWidget(
                    buttonText: "Select Account",
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
