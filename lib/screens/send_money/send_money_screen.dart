import 'package:flutter/material.dart';

import '../../constant/color_manger.dart';
import '../../constant/constants.dart';
import '../../constant/style_manager.dart';
import '../../constant/values_manger.dart';
import '../home/main/main_money/main_money_transfer_widget.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBox12,
              Text(
                "Send Money",
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                    color: ColorManager.black3, fontSize: AppSize.s16),
              ),
              kSizedBox16,
              MainMoneyTransferWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
