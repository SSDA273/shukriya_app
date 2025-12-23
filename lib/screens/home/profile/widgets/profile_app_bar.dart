import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/extension/string_extension.dart';

import '../../../../constant/api_const/app_api.dart';
import '../../../../constant/app_routes.dart';
import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../core/notifier/customer/customer_profile_notifier.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileNotifier =
        Provider.of<CustomerProfileNotifier>(context, listen: false);
    return Stack(
      children: <Widget>[
        Container(
          height: 167.h,
          decoration: const BoxDecoration(
            color: Color(0xff2f1733),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
        ),
        Positioned(
          bottom: -10.h,
          right: 30.w,
          child: Opacity(
            opacity: 0.5,
            child: SvgPicture.asset(
              ImageAssets.homeBgFrame,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              //App Bar Widget
              Padding(
                padding:  EdgeInsets.only(
                    left: AppPadding.p16.w, top: AppPadding.p12.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        ImageAssets.leftArrowIc,
                        color: ColorManager.white,
                        height: 22,
                        width: 22,
                      ),
                    ),
                    kSizedW10,
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              kSizedBox35,
              Padding(
                padding:  EdgeInsets.only(
                    left: AppPadding.p20.w, right: AppPadding.p24.w,),
                child: Row(
                  children: [
                    Container(
                      height: 56.w,
                      width: 56.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.secondaryDark,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white38,
                            spreadRadius: 1,
                            blurRadius: 15
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            "${AppAPI.baseUrl}/files?key=${profileNotifier.getCustomerImage}",
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                      child: (profileNotifier.getCustomerImage ?? '').isEmpty
                          ? SvgPicture.asset(
                              ImageAssets.profile,
                              height: 15.15,
                              width: 11.65,
                            )
                          : null,
                    ),
                    kSizedW10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileNotifier.getCustomerName ?? "",
                          style: getSemiBoldStyle(
                              color: ColorManager.secondaryDark,
                              fontSize: FontSize.s14),
                        ),
                        kSizedBox5,
                        Text((profileNotifier.getCustomerNumber ?? '').maskNumber((profileNotifier.getCustomerNumber ?? '').length),
                          style: getRegularStyle(
                            color: ColorManager.grey5,
                          ),
                        ),
                        kSizedBox8,
                        Row(
                          children: [
                            SizedBox(
                              height: 3.h,
                              width: 118.w,
                              child: LinearProgressIndicator(
                                backgroundColor: ColorManager.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorManager.secondaryDark,
                                ),
                                value: 0.5,
                              ),
                            ),
                            kSizedW5,
                            Text(
                              "50%",
                              style: getSemiBoldStyle(
                                  color: ColorManager.secondaryDark,
                                  fontSize: FontSize.s10),
                            )
                          ],
                        ),
                      ],
                    ),
                   const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: ()=>showFrontModel(context),
                            child: SvgPicture.asset(ImageAssets.editIc)),
                        Text(
                          "Edit",
                          style: getRegularStyle(color: ColorManager.grey4),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Future  showFrontModel(BuildContext context){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 184.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p24,horizontal: AppPadding.p24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Edit Profile",
                      style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s18),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.close_rounded))
                    ],
                  ),
                ),
                kSizedBox5,
                InkWell(
                  onTap: ()=>Navigator.pushNamed(context, editProfileRoute),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.scan),
                      kSizedW15,
                      Text(
                        "Change Picture",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                ),
                kSizedBox18,
                Divider(
                  color: ColorManager.tertiary,
                ),
                kSizedBox18,
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          ImageAssets.upload),
                      kSizedW15,
                      Text(
                        "Emirates ID",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            color: Color(0xFF333333)),
                      ),
                      // Spacer(),
                      // Icon(Icons.check_circle,
                      // color: ColorManager.primary,)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
