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
import 'package:unitey_app/core/notifier/remittance/exchange_house_list_provider.dart';

import 'exchange_house_filter_screen.dart';

class ExchangeHousesListScreen extends StatelessWidget {
  const ExchangeHousesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exchangeHousesList = Provider.of<ExchangeHouseListNotifier>(context,listen: false);
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor:ColorManager.white,
        elevation: 0,
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p16,bottom: AppPadding.p8),
            child: SvgPicture.asset(
              ImageAssets.leftArrowIc,
            ),
          ),
        ),
        leadingWidth: 38,
        toolbarHeight: 78.h,
        centerTitle: false,
        titleSpacing: 8,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Choose Exchange House",
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s16),
            ),
            Text(
              "Showing ${exchangeHousesList.getTotalLength} results",
              style: getRegularStyle(
                  color: ColorManager.grey1, fontSize: FontSize.s12),
            ),
          ],
        ),
        actions: [
          InkWell(
            splashColor:Colors.transparent ,
            highlightColor: Colors.transparent,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExchangeHouseFilterScreen()));
            },
            child: SvgPicture.asset(
              ImageAssets.filterIc,
            ),
          ),
          kSizedW15,
          SvgPicture.asset(
            ImageAssets.sortIc,
          ),
          kSizedW20,
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: AppPadding.p30.h),
        itemCount: exchangeHousesList.getTotalLength,
        itemBuilder: (context, index) {
          final exchangeHouse = exchangeHousesList.getExchangeHouseModel!.result![0].products![index];
          return Container(
            height: 132.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFF8F9FD),
                    ColorManager.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  child: Container(
                    height: 114.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: AppMargin.m6.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p30,top: AppPadding.p18,right: AppPadding.p30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color:Color(0xFFEFEFEF),
                                        width: 1
                                    ),
                                    color: ColorManager.white,
                                image: DecorationImage(
                                  image: NetworkImage( "${AppAPI.baseUrl}/files?key=${exchangeHouse.logo ?? ""}"),
                                  fit: BoxFit.cover
                                )),
                              ),
                              kSizedW7,
                              Text(exchangeHouse.name??"",
                                style: getBoldStyle(color: ColorManager.black3,fontSize: FontSize.s14),),
                              Spacer(),
                              Container(
                                height: 24.h,
                                width: 24.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:ColorManager.grey4,
                                        width: 1
                                    ),
                                    shape: BoxShape.circle,
                                    color: ColorManager.white),
                              ),

                            ],
                          ),
                          kSizedBox8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Transfer Fee",
                                    style: getRegularStyle(color: ColorManager.grey2),),
                                  kSizedBox5,
                                  Container(
                                    height: 22.h,
                                    width: 67.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFBF5FC),
                                        border: Border.all(color: ColorManager.grey4,width: 0.2),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(ImageAssets.sendIc,),
                                        Text("${exchangeHouse.fee?.feeMin??""} AED ",
                                          style: getSemiBoldStyle(color: ColorManager.black),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Time Taken",
                                    style: getRegularStyle(color: ColorManager.grey2),),
                                  kSizedBox5,
                                  Container(
                                    height: 22.h,
                                    width: 66.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFBF5FC),
                                        border: Border.all(color: ColorManager.grey4,width: 0.2),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(ImageAssets.clockIc,),
                                        Text("2 days",
                                          style: getSemiBoldStyle(color: ColorManager.black,),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Conversion Rate",
                                    style: getRegularStyle(color: ColorManager.grey2),),
                                  kSizedBox5,
                                  Container(
                                    height: 22.h,
                                    width: 118.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFBF5FC),
                                        border: Border.all(color: ColorManager.grey4,width: 0.2),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("1 ${exchangeHouse.fee?.fromCurrency??""} = ${exchangeHouse.fee?.fxRate??""} ${exchangeHouse.fee?.toCurrency??""}",
                                            style: getSemiBoldStyle(color: ColorManager.black,))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p8),
                  child: SvgPicture.asset(
                    ImageAssets.ratingBadge,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, snapshot) {
          return kSizedBox22;
    },
      ),
    );
  }
}
