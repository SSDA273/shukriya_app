import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/screens/home/main/main_card/widgets/app_bar_widget.dart';
import 'package:unitey_app/screens/home/main/main_card/widgets/balance_widget.dart';
import 'package:unitey_app/screens/home/main/main_card/widgets/recent_transactions_screen.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/font_manager.dart';
import '../../../../core/notifier/account_details_notifier.dart';
import '../../../../generated/l10n.dart';
import 'widgets/custom_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 360.h,
          decoration: const BoxDecoration(
            color: Color(0xff2f1733),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 141,
          right: 70,
          // top: 141,
          // left: 213,
          child: Opacity(
            opacity: 0.5,
            child: SvgPicture.asset(
              ImageAssets.homeBgFrame,
              height: 150,
              // width: 105,
              // height: 147,
              // color: Color.fromRGBO(38, 38, 38, 0.4),
              // color:const Color(0xffFD5BAA),
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              //App Bar Widget
              const AppBarWidget(),

              kSizedBox12,
              //Balance Widget
              Consumer<AccountDetailsNotifier>(builder: (context, snapshot, child) {
                return snapshot.isLoading == true
                    ? const Center(
                    child: CircularIndicatorWidget())
                    : snapshot.getAccountDetailsModel?.result?.data != null
                    ? InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecentTransactionScreen()));
                  },
                      child: BalanceWidget(
                      text: S.of(context).totalBalance,
                      subText: "${snapshot.getAccountDetailsModel!.result!.data.accountBalance} ${snapshot.getAccountDetailsModel!.result!.data.accountBalanceCurrency}",
                  ),
                    )
                    : Center(
                      child: Text(
                        "Account details not available",
                        style: TextStyle(color: ColorManager.white),
                      ),
                    );
                }
              ),
              kSizedBox16,
              Divider(
                color: ColorManager.primary,
                height: 2,
              ),
              kSizedBox12,
              BalanceWidget(
                text: S.of(context).shukriaWallet,
                subText: "40 ${S.of(context).points}",
                style: getBoldStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s22,
                ),
              ),
              kSizedBox25,
              //Card Widget
              const CardWidget(),
              kSizedBox16
            ],
          ),
        ),
      ],
    );
  }
}
