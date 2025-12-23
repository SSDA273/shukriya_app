import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/screens/home/add_beneficiary/add_beneficiary_screen.dart';
import 'package:unitey_app/screens/receive_money/receive_money_screen.dart';

import '../../../generated/l10n.dart';

class ShortcutWidget extends StatelessWidget {
  const ShortcutWidget({Key? key, required this.payKey, required this.sendKey})
      : super(key: key);
  final GlobalKey<State<StatefulWidget>> payKey;
  final GlobalKey<State<StatefulWidget>> sendKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ShortcutCustomWidget(
            onTap: () {
              Scrollable.ensureVisible(
                payKey.currentContext ?? context,
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
              );
            },
            icon: ImageAssets.billPaymentIc,
            color: Color(0xFFFEF8F3),
            text: S.of(context).billPayment,
          ),
          ShortcutCustomWidget(
            onTap: () {
              Scrollable.ensureVisible(
                sendKey.currentContext ?? context,
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
              );
            },
            icon: ImageAssets.sendMoneyIc,
            color: Color(0xFFF9F6F9),
            text: S.of(context).sendMoney,
          ),
          ShortcutCustomWidget(
            onTap: () {},
            icon: ImageAssets.rewardPointsIc,
            color: Color(0xFFFDF3F9),
            text: S.of(context).rewardsPoints,
          ),
          ShortcutCustomWidget(
            onTap: () {},
            icon: ImageAssets.superSavingsIc,
            color: Color(0xFFFEF8F3),
            text: S.of(context).superSavings,
          ),
          ShortcutCustomWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReceiveMoneyScreen()));
            },
            icon: ImageAssets.scanAndPayIc,
            color: Color(0xFFFDF3F9),
            text: S.of(context).scanPay,
          ),
          ShortcutCustomWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddBeneficiaryScreen()));
            },
            last: true,
            icon: ImageAssets.addIc,
            color: Color(0xFFF9F6F9),
            text: S.of(context).addBeneficiary,
          ),
        ],
      ),
    );
  }
}

class ShortcutCustomWidget extends StatelessWidget {
  const ShortcutCustomWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.color,
    this.last = false,
  }) : super(key: key);

  final Function() onTap;
  final String text, icon;
  final Color color;
  final bool? last;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppPadding.p20,
            bottom: AppPadding.p30,
            right: last == true ? AppPadding.p20 : 0),
        child: Column(
          children: [
            Container(
              height: 54.h,
              width: 54.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: color),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            kSizedBox5,
            SizedBox(
              width: 64.w,
              height: 36.h,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(color: ColorManager.grey1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
