import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/screens/home/profile/widgets/profile_app_bar.dart';
import 'package:unitey_app/screens/home/profile/widgets/profile_tile_widget.dart';
import '../../../constant/api_const/app_api.dart';
import '../../../constant/app_routes.dart';
import '../../../constant/asset_manager.dart';
import '../../../constant/constants.dart';
import '../../../core/notifier/customer/customer_profile_notifier.dart';
import '../../../core/services/cache_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(),
          ProfileTileWidget(
            icon: ImageAssets.recurringIc,
            text: "Recurring Transaction",
            onTap: () {},
          ),
          ProfileTileWidget(
            icon: ImageAssets.manageIc,
            text: "Manage WPS Card",
            actionRequired: true,
            onTap: () {},
          ),
          ProfileTileWidget(
            icon: ImageAssets.aboutIc,
            text: "About",
            onTap: () {},
          ),
          ProfileTileWidget(
            icon: ImageAssets.settingsIc,
            text: "Settings",
            newAction: true,
            onTap: () {},
          ),
          ProfileTileWidget(
            icon: ImageAssets.logoutIc,
            text: "Logout",
            onTap: () => logOutAlert(context),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.fromLTRB(AppPadding.p16, 0, AppPadding.p16, AppPadding.p24),
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFF9F5F9),
              borderRadius:BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.contactUsIc),
                kSizedW5,
                Text("Feel free to ask, we are ready to help",
                style: getSemiBoldStyle(color: ColorManager.primary1,fontSize: FontSize.s14),)
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool> logOutAlert(BuildContext context) async {
    final CacheService _cache = CacheService();
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          'Signout of your account ?',
          style: getSemiBoldStyle(color: ColorManager.black3,fontSize: FontSize.s16),
        ),
        content: Text(
          'You will loose on your credentials once logged out.',
          style: getRegularStyle(color: ColorManager.grey3,fontSize: FontSize.s14),
        ),
        actions: [
          TextButton(onPressed: ()=> Navigator.of(context).pop(false), child: Text("Cancel",
            style: getSemiBoldStyle(color: ColorManager.primary1,fontSize: FontSize.s16),))

          ,  TextButton(onPressed: ()async {
            await _cache.deleteCache();
            Navigator.of(context).pop(true);
            Navigator.pushNamedAndRemoveUntil(
                context, loginRoute, (route) => false);
          }, child: Text("Signout",
            style: getSemiBoldStyle(color: ColorManager.primary1,fontSize: FontSize.s16),))
          ,
        ],
      ),
    ) ;
  }

}
