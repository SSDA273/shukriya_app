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
            height: 59.h,
            width: 93.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: const DecorationImage(
                image: AssetImage(ImageAssets.cardDemo),
                fit: BoxFit.fill,
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 1),
                    blurRadius: 7,
                    spreadRadius: 2)
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 5.w,
                  bottom: 6.h,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF004961), // Matches the card Teal
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      cardDetails.accountName.toUpperCase(),
                      style: getBoldStyle(
                        color: ColorManager.white,
                        fontSize: 4.sp,
                      ).copyWith(letterSpacing: 0.4),
                    ),
                  ),
                ),
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