import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import '../constant/color_manger.dart';
import '../core/notifier/account_details_notifier.dart';
import '../generated/l10n.dart';

class SmallCardWidget extends StatelessWidget {
  const SmallCardWidget({
    Key? key,
    required this.height,
    this.cardChangeTap
  }) : super(key: key);

  final double height;
  final void Function()? cardChangeTap;

  @override
  Widget build(BuildContext context) {
    final accountNotifier = Provider.of<AccountDetailsNotifier>(context, listen: false);
    final cardDetails = accountNotifier.getAccountDetailsModel?.result?.data;
    
    // Return a placeholder if card details are not available
    if (cardDetails == null) {
      return Container(
        height: height.h,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        decoration: BoxDecoration(
          color: Color(0xFFF9F5F9),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFE0CBE1)),
        ),
        child: Center(
          child: Text(
            "Card details loading...",
            style: TextStyle(color: ColorManager.grey),
          ),
        ),
      );
    }
    return Container(
      height: height.h,
      padding:const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      decoration: BoxDecoration(
          color: Color(0xFFF9F5F9),
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(
            color: Color(0xFFE0CBE1),
          )
      ),
      child:  Row(
        children: [
          //Card Widget
          Container(
            padding: const EdgeInsets.fromLTRB(AppPadding.p6, AppPadding.p8, AppPadding.p12, AppPadding.p6),
            height: 59.h,
            width: 93.w,
            decoration: BoxDecoration(
              color:ColorManager.primary,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 1),
                    blurRadius: 7,
                    spreadRadius: 2)
              ],
            ),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/fardan.png",
                      width: 40,
                    ),

                    SvgPicture.asset(
                      ImageAssets.cardChip,
                      height: 9,
                      width: 13,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "${cardDetails.accountNumberLast4}\n",
                                style: getBoldStyle(color: ColorManager.white,fontSize: 5)
                            ),
                            TextSpan(
                                text: cardDetails.accountName,
                                style: getRegularStyle(color: ColorManager.white,fontSize:5))
                          ],
                        )),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/mercury.jpeg",
                          width: 10,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          cardDetails.expiry,
                          style: getRegularStyle(color: ColorManager.white,fontSize: 5),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          kSizedW12,
          //Text Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).wpsSalaryCard,
                style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s14),),
              kSizedBox5,Text(cardDetails.accountNumberLast4,
                style: getRegularStyle(color: ColorManager.grey2,),),
              kSizedBox5,Text("${S.of(context).balance} : ${cardDetails.accountBalanceCurrency} ${cardDetails.accountBalance}",
                style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),),
              //Todo: Disable when amount is insufficient
              // Text("Insufficient Balance",
              // style: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s10),)
            ],
          ),
          const Spacer(),
          cardChangeTap!=null?TextButton(
              onPressed: cardChangeTap,
              child: Text("Change",
              style: getSemiBoldStyle(color: ColorManager.tertiary).copyWith(decoration: TextDecoration.underline),)):
              kSizedBox
        ],
      ),
    );
  }
}