import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/screens/home/main/main_latest_exchanges/widgets/latest_exchange_house_widget.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../core/notifier/remittance/exchange_house_list_provider.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/circular_indicator_widget.dart';
import '../main_money/main_money_transfer_widget.dart';

class MainLatestExchanges extends StatelessWidget {
  const MainLatestExchanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m16, vertical: AppMargin.m8),
      padding: EdgeInsets.fromLTRB(AppPadding.p14.w, AppPadding.p20.h,
          AppPadding.p14.w, AppPadding.p20.h),
      // height: 570.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.grey5, width: 1),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).exploreExHouseRatesToday,
            style:
                getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
          ),
          kSizedBox8,
          Text(S.of(context).showTopBestResults,
              style: Theme.of(context).textTheme.bodyLarge),
          kSizedBox20,
          Container(
            // height: 365.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorManager.secondary, width: 1)),

            child: Consumer<ExchangeHouseListNotifier>(
                builder: (context, snapshot, child) {
              return snapshot.isLoading == true
                  ? const CircularIndicatorWidget()
                  : snapshot.getExchangeHouseModel?.result?.isNotEmpty == true &&
                          snapshot.getExchangeHouseModel!.result![0].products?.isNotEmpty == true
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.getTotalLength > 3
                              ? 3
                              : snapshot.getTotalLength,
                          itemBuilder: (context, index) {
                            final exchangeHouse = snapshot
                                .getExchangeHouseModel!.result![0].products![index];
                            // Todo: Change it to solve the error
                            return LatestExchangeHouseWidget(
                              exchangeProductModel: exchangeHouse,
                            );
                          },
                          padding: const EdgeInsets.only(
                              top: AppPadding.p16, bottom: AppPadding.p15),
                          separatorBuilder: (context, index) => Divider(
                            height: 20,
                            color: ColorManager.secondary,
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
                            child: Text(
                              "Exchange rates not available at the moment",
                              style: getRegularStyle(
                                  color: ColorManager.grey, fontSize: FontSize.s14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
            }),
          ),
          kSizedBox20,
          RoundedButtonWidget(
            buttonText: S.of(context).seeExchangeHouses,
            onPressed: () {
              Navigator.pushNamed(context, exchangeHousesListRoute);
            },
          ),
        ],
      ),
    );
  }
}
