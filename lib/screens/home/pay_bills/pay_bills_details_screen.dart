import 'package:flutter/material.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/bills_details_app_bar.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/number_details_widget.dart';
import 'package:unitey_app/screens/home/pay_bills/widgets/wallet_and%20_amount_details.dart';
import '../../../constant/asset_manager.dart';

class PayBillsDetailsScreen extends StatelessWidget {
  const PayBillsDetailsScreen({Key? key, this.type}) : super(key: key);
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FD),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //AppBar
                    BillsDetailsAppBar(),
                    //Number and Card Details
                    NumberDetailsWidget(
                      type: type,
                    ),
                    //Wallet Points and Amount details
                    WalletAndAmountDetails(
                      type: type,
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0, right: 0, child: Image.asset(ImageAssets.billsBg)),
            ],
          ),
        ),
      ),
    );
  }
}
