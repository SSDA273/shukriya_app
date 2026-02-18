import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/biller_image_widget.dart';
import '../../../../../provider/beneficiary_select_notifier.dart';

class CircleBeneficiaryWidget extends StatelessWidget {
  final String beneficiaryName;
  final String beneficiaryImage;
  final String beneficiaryId;

  const CircleBeneficiaryWidget(
      {Key? key,
      required this.beneficiaryId,
      required this.beneficiaryName,
      required this.beneficiaryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedNotifier =
        Provider.of<BeneficiarySelectNotifier>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p18),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: BillerImage(
                  imageKey: beneficiaryImage,
                  fallbackAsset: ImageAssets.profile,
                  height: 48.r,
                  width: 48.r,
                  fit: BoxFit.cover,
                ),
              ),
              if (beneficiaryId == selectedNotifier.getBeneficiaryId)
                CircleAvatar(
                    radius: 24.r,
                    backgroundColor: const Color(0xFF27AE60).withOpacity(0.6),
                    child: SvgPicture.asset(ImageAssets.selected)),
            ],
          ),
          kSizedBox10,
          Text(beneficiaryName,
              textAlign: TextAlign.center,
              style: getRegularStyle(color: ColorManager.grey1)),
          beneficiaryId == selectedNotifier.getBeneficiaryId
              ? Container(
            margin: const EdgeInsets.only(top: AppPadding.p2),
                  width: 64.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    S.of(context).selected,
                    textAlign: TextAlign.center,
                    style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s10),
                  ),
                )
              : kSizedBox
        ],
      ),
    );
  }
}

// Stack(
// children: [
// CircleAvatar(
// radius: 32,
// backgroundImage:  NetworkImage("${AppAPI.baseUrl}/files?key=$beneficiaryImage"),
// ),
// Positioned(
// right: -10,
// top: -10,
// child: IconButton(
// onPressed: (){},
// icon: const Icon(Icons.remove_circle,
// color: Colors.red,),
// ))
// ],
// ),
