import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/extension/string_extension.dart';

import '../../../constant/app_routes.dart';
import '../../../constant/asset_manager.dart';
class AddBeneficiarySuccessScreen extends StatelessWidget {
  const AddBeneficiarySuccessScreen({Key? key,
    required this.bankName,
    required this.accountNo,
    required this.country,
    required this.name,
    required this.ibanNo,
    this.ifscCode
  }) : super(key: key);
final String name,accountNo,bankName,country,ibanNo;
final String? ifscCode;
  @override
  Widget build(BuildContext context) {
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
            bottom: 0,
            right: 0,
            child: Image.asset(
              ImageAssets.bg,
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kSizedBox12,
                  DottedBorder(
                    borderType: BorderType.Circle,
                    color: ColorManager.grey5,
                    dashPattern: [8,7],
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 60.w,
                        width: 60.w,
                        margin: EdgeInsets.all(8),
                        child: Lottie.asset(ImageAssets.congratulation,fit: BoxFit.cover),
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: ColorManager.white,
                    //   radius: 35.r,
                    //   child: Lottie.asset(ImageAssets.congratulation)),
                  ),
                  kSizedBox20,
                  Text(
                    "Congratulations!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  kSizedBox5,
                  Text(
                    "Beneficiary Added Successfully",
                    style: getRegularStyle(
                        color: ColorManager.secondary, fontSize: FontSize.s14),
                  ),
                  kSizedBox20,
                  Container(
                    height: 264.h,
                    width: 322.w,
                    padding:  EdgeInsets.symmetric(vertical: AppPadding.p24.h,horizontal: AppPadding.p24.w),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.15),
                            // color: ColorManager.black,
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: 5
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SuccessNameTile(hint:"Name",value: name.capitalize()),
                        SuccessNameTile(hint:"Account Number",value: accountNo),
                        SuccessNameTile(hint:"Country",value: country.toUpperCase()),
                        ifscCode!=null?SuccessNameTile(hint:"IFSC Code",value: ifscCode!.toUpperCase()):SizedBox(),
                        SuccessNameTile(hint:"Branch Name",value: bankName),

                        // Text(
                        //   otpResponse.getOtpResponse!.result!.referenceNumber,
                        //   style: getBoldStyle(
                        //       color: ColorManager.primary,
                        //       fontSize: FontSize.s16),
                        // ),

                      ],
                    ),
                  ),
                  kSizedBox40,
                  GestureDetector(
                    onTap: () async{
                      Navigator.pushNamedAndRemoveUntil(context, mainRoute, (route) => false);
                    },
                    child: Container(
                      height: 46.h,
                      width: 161.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF7B3884),
                            Color(0xffC34BD4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text("Go to home",
                            style: getBoldStyle(
                                color: ColorManager.white, fontSize: FontSize.s16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class SuccessNameTile extends StatelessWidget {
  const SuccessNameTile({
    Key? key,
    required this.hint,
    required this.value,
  }) : super(key: key);

  final String value,hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hint,
        style: getRegularStyle(color: ColorManager.grey3,fontSize: FontSize.s14),),
        Text(
          value,
          style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),
        )
      ],
    );
  }
}
