import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

import '../../constant/font_manager.dart';
import '../../constant/string_manager.dart';
import '../../core/notifier/customer/customer_profile_notifier.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerProfile =
    Provider.of<CustomerProfileNotifier>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              kSizedBox12,
              Text(
                "Receive Money through\nSender Scan",
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                    color: ColorManager.black3, fontSize: AppSize.s16),
              ),
              kSizedBox16,
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFFBF7),
                    border: Border.all(color: Color(0xFFFED7B4),),
                borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.only(
                    top: AppPadding.p60.w, left: AppPadding.p16.h,right: AppPadding.p16.w),
                height: 397.h,
                width: 328.w,
                child: Column(
                  children: [
                    Text(
                      (customerProfile.getCustomerNumber ?? '').replaceAll(RegExp(r'.(?=.{4})'), '*'),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.primary),
                    ),
                    kSizedBox16,
                    QrImageView(
                      data: "QRCode from ${AppStrings.appName}",
                      version: QrVersions.auto,
                      size: 200,
                    ),
                    kSizedBox16,
                    Text("Request sender to scan this QR code.",
                    style: getRegularStyle(color: ColorManager.grey3,fontSize: AppSize.s16),),
                    kSizedBox12,
                    GestureDetector(
                  onTap:() {},
                  child: Container(
                    height: 46.h,
                    padding: const EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p8, top: 5, bottom: 6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          //Color(0xFF7B3884),
                          //Color(0xffC34BD4),
                          Color.fromARGB(255, 77, 187, 55),
                          Color.fromARGB(255, 9, 121, 50),
                          
                        ],
                      ),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Share your QR Code",
                            style: getSemiBoldStyle(
                                color: ColorManager.white, fontSize: FontSize.s16)),
                        Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(255, 255, 255, 0.5),
                                    Color.fromRGBO(255, 255, 255, 0),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: Center(
                              child: SvgPicture.asset(ImageAssets.qrShareIc,
                              height: 20,),
                            ))
                      ],
                    ),
                  ),
                )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
