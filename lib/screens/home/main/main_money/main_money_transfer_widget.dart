import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/screens/home/main/main_money/widgets/beneficiary_list_widget.dart';
import 'package:unitey_app/screens/home/main/main_money/widgets/currency_selection_widget.dart';
import 'package:unitey_app/screens/home/main/main_money/widgets/selected_exchange_house_widget.dart';

import '../../../../constant/constants.dart';
import '../../../../generated/l10n.dart';

class MainMoneyTransferWidget extends StatelessWidget {
  const MainMoneyTransferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m16,),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.fromLTRB(
          AppPadding.p16, AppPadding.p13, AppPadding.p16, AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220.w,
            child: Text(
              S.of(context).getMoneyTranxRateToday,
              style:
                  getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
            ),
          ),
          kSizedBox5,
          Text(S.of(context).cfMoneyExHousesSend,
              style: Theme.of(context).textTheme.bodyLarge),
          kSizedBox24,
          //Currency Selection Screen
          const CurrencySelectionWidget(),
          //Money Text Field
          // const MoneyTextWidget(),
          kSizedBox24,
          //Exchange House Selection Widget
          const SelectedExchangeHouseWidget(),
          kSizedBox25,
          //Beneficiary List Widget
          const BeneficiaryListWidget(),
          kSizedBox8,

        ],
      ),
    );
  }
}

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const RoundedButtonWidget(
      {required this.buttonText, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {onPressed();},
      child: Container(
        height: 46.h,
        padding: const EdgeInsets.only(
            left: AppPadding.p20, right: AppPadding.p8, top: 5, bottom: 6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Color(0xFF7B3884),
              //Color(0xffC34BD4),
              Color.fromARGB(255, 77, 187, 55),
              Color.fromARGB(255, 9, 121, 50),
            ],
          ),
          borderRadius: BorderRadius.circular(80),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(buttonText,
                  style: getBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s16)),
            ),
            Container(
                height: 35.w,
                width: 35.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Center(child: SvgPicture.asset(ImageAssets.arrowRightIc)))
          ],
        ),
      ),
    );
  }
}
