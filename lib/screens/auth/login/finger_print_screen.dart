import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import '../../../core/services/local_auth_service.dart';
import '../../../generated/l10n.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              //HexColor.fromHex("#1cd475"),
              ColorManager.primary,
              ColorManager.darkPrimary,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    ImageAssets.languageBg,
                  ),
                )),
            Positioned(
              top: 170.h,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  final isAuthenticated =
                      await LocalAuthService.authenticate(context: context);

                  if (isAuthenticated) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(mainRoute, (route) => false);
                  }
                },
                child: SvgPicture.asset(
                  ImageAssets.fingerPrintIc,
                ),
              ),
            ),
            Positioned(
              top: 360.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Text(
                 S.of(context).touchHere,
                  textAlign: TextAlign.center,

                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s20),
                ),
              ),
            ),
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       GestureDetector(
            //         onTap:()async{
            //           final isAuthenticated =
            //               await LocalAuthService.authenticate(
            //               context: context);
            //
            //           if (isAuthenticated) {
            //             Navigator.of(context).pushNamedAndRemoveUntil(mainRoute, (route) => false);
            //           }
            //         },
            //           child: SvgPicture.asset(ImageAssets.fingerPrintIc,),),
            //       Text("Touch here to Log In",
            //       style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s20),),
            //       kSizedBox25,
            //     ],
            //   ),
            // ),

            // Positioned(
            //     right: 0,
            //     left: 0,
            //     bottom: 40.h,
            //     child: Text("Switch to password MPIN",
            //         textAlign: TextAlign.center,
            //         style: Theme.of(context)
            //             .textTheme
            //             .subtitle1!
            //             .copyWith(color: ColorManager.secondary))),
          ],
        ),
      ),
    );
  }
}
