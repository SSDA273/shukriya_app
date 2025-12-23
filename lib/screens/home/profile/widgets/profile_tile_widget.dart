import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    required this.text,
    required this.icon,
    this.actionRequired = false,
    this.newAction = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String icon, text;
  final bool actionRequired;
  final bool newAction;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppPadding.p16.w,
        right: actionRequired
            ? AppPadding.p16.w
            : newAction
                ? AppPadding.p16.w
                : AppPadding.p24.w,
        top: AppPadding.p24.w,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            kSizedW12,
            Text(
              text,
              style: getBoldStyle(
                color: ColorManager.primary1,
                fontSize: FontSize.s14,
              ),
            ),
            Spacer(),

            /// ACTION REQUIRED
            actionRequired
                ? Container(
                    height: 26.h,
                    width: 111.w,
                    decoration: BoxDecoration(
                      color: ColorManager.quaternary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Action required",
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s10,
                          ),
                        ),
                        SvgPicture.asset(
                          ImageAssets.detailsArrowIc,
                          height: 10.h,
                          color: ColorManager.white,
                        ),
                      ],
                    ),
                  )

                /// NEW ACTION (DISTINCT COLOR)
                : newAction
                    ? Container(
                        height: 24.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          // ✅ USES NEW ACTION BADGE COLOR
                          color: ColorManager.newActionBadge,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "2 New",
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s10,
                              ),
                            ),
                            SvgPicture.asset(
                              ImageAssets.detailsArrowIc,
                              height: 10.h,
                              color: ColorManager.white,
                            ),
                          ],
                        ),
                      )

                    /// DEFAULT ARROW
                    : SvgPicture.asset(
                        ImageAssets.detailsArrowIc,
                        height: 14.h,
                      ),
          ],
        ),
      ),
    );
  }
}
