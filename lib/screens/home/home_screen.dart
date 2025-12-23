import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/screens/home/main/main_card/widgets/recent_transactions_screen.dart';
import 'package:unitey_app/screens/home/widgets/first_ads_widget.dart';
import 'main/main_bills/main_bills_widget.dart';
import 'main/main_card/main_card_widget.dart';
import 'main/main_invite_widget.dart';
import 'main/main_latest_exchanges/main_latest_exhanges.dart';
import 'main/main_money/main_money_transfer_widget.dart';
import 'main/shortcut_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final dataKey = GlobalKey();
  final sendKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        // controller: scrollController,
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Main Balance and Card Widget
              const MainCardWidget(),
              //Shortcut Widgets
              ShortcutWidget(
                payKey: dataKey,
                sendKey: sendKey,
              ),
              //Main Money Transfer Widget
              MainMoneyTransferWidget(
                key: sendKey,
              ),
              //Ads 1 Widget
              const FirstAdsWidget(
                height: 101,
                image: "assets/images/adsBanner.png",
              ),
              // Latest Exchange Houses List
              const MainLatestExchanges(),
              // //People Widget
              //  MainPeopleWidget(),
              //Ads 2 Widget
              const FirstAdsWidget(
                height: 226,
                image: "assets/images/food.jpg",
              ),
              //Bills Widget
              MainBillsWidget(
                key: dataKey,
              ),
              //Invite Friend
              const MainInviteWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

