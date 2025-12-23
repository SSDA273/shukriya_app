import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/amount_selection_widget.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/billers_app_bar.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/choose_title_widget.dart';

class PayBillAmountScreen extends HookWidget {
  const PayBillAmountScreen({Key? key, this.type}) : super(key: key);
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //AppBar
                    BillersAppBar(
                      type: type,
                    ),
                    //Choose Title
                    ChooseTitleWidget(),
                    //Amount Selection
                    AmountSelectionWidget(
                      type: type,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(ImageAssets.billsBg)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
