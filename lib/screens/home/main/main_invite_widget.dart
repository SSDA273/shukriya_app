import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

import '../../../generated/l10n.dart';

class MainInviteWidget extends StatelessWidget {
  const MainInviteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 40),
      child:Container(
        height: 230,
        padding:EdgeInsets.fromLTRB(AppPadding.p20, AppPadding.p24, 0,AppPadding.p6),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/wave.png"),
                fit: BoxFit.cover
            )
        ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
              right: 0,
              child: Image.asset("assets/images/invite.png")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).inviteFriendsEarn,
              style: Theme.of(context).textTheme.titleLarge,) ,
              kSizedBox5,
              Text(S.of(context).earnPointsFutherShop,
              style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s12),),
              kSizedBox20,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${S.of(context).copyCode}: ",
                  style: getRegularStyle(color: ColorManager.black),),
                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.file_copy_outlined,
                      size: 15,
                    ),
                  ),
                ],
              ),
              kSizedBox5,
              Text("rEfer2020",
                style: getBoldStyle(color: ColorManager.black),),
              kSizedBox20,
              OutlinedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(const Size(94, 30)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.black)
                          )
                      )),
                  onPressed: (){}, child: Text(S.of(context).invite,
                  style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s10)))

            ],
          ),
        ],
      ),),
    );
  }
}
