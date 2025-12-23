import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/account_details_notifier.dart';
import 'package:unitey_app/core/notifier/billers/billers_list_notifier.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/screens/home/add_bills/sub_category_screen.dart';
import 'package:unitey_app/screens/home/pay_bills/pay_bill_amount_screen.dart';
import 'package:unitey_app/screens/home/widgets/first_ads_widget.dart';

class AddBillsScreen extends StatelessWidget {
  const AddBillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddBillsAppBar(),
            const BillsGridWidget(),
            FirstAdsWidget(height: 100.h, image: "assets/images/billAds.png"),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16, vertical: AppPadding.p12),
              child: Text("History of Past bills",
                style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16,
                ),),
            )
          ],
        ),
      ),
    );
  }
}

class BillsGridWidget extends StatelessWidget {
  const BillsGridWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final BillsSelectionNotifier selectBiller =
    Provider.of<BillsSelectionNotifier>(context, listen: false);
    final BillerListNotifier billerListNotifier =
    Provider.of<BillerListNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Billers",
            style:
                getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
          ),
          kSizedBox12,
          billerListNotifier.getTotalLength == 0
              ? const AddBillsCustomWidget()
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: billerListNotifier.getTotalLength + 1,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 120.h),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const AddBillsCustomWidget();
                    }
                    final billers =
                        billerListNotifier.getBillersList!.result![index - 1];
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            if (billers.productId!.configurations!.shortcode ==
                                'MBR') {
                              selectBiller.selectedBiller(billers);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PayBillAmountScreen()
                              ));
                            }
                          },
                          child: Container(
                            height: 73.h,
                            width: 72.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                                "${AppAPI.baseUrl}/files?key=${billers.productId!.logo}"),
                          ),
                        ),
                        kSizedBox12,
                        Text(
                          billers.billerNickName!,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(color: ColorManager.black3),
                        )
                      ],
                    );
                  })
        ],
      ),
    );
  }
}

class AddBillsCustomWidget extends StatelessWidget {
  const AddBillsCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SubCategoryScreen()));
          },
          child: Container(
            height: 73.h,
            width: 72.w,
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: DottedBorder(
                borderType: BorderType.Circle,
                color: ColorManager.tertiary,
                dashPattern: [7, 6],
                radius: Radius.circular(2),
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.add,
                  color: ColorManager.white,
                ),
                // CircleAvatar(
                //   backgroundColor: ColorManager.white,
                //   radius: 35.r,
                //   child: Lottie.asset(ImageAssets.congratulation)),
              ),
            ),
          ),
        ),
        kSizedBox12,
        Text(
          "Add",
          textAlign: TextAlign.center,
          style: getSemiBoldStyle(color: ColorManager.black3),
        )
      ],
    );
  }
}

class AddBillsAppBar extends StatelessWidget {
  const AddBillsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountDetails = Provider.of<AccountDetailsNotifier>(context,listen: false).getAccountDetailsModel!.result!.data;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff2f1733),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 108.h,
            left: 234.w,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                ImageAssets.homeBgFrame,
                height: 147.h,
                // width: 105,
                // height: 147,
                // color: Color.fromRGBO(38, 38, 38, 0.4),
                // color:const Color(0xffFD5BAA),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //App Bar Widget
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p6.w,),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: SvgPicture.asset(
                            ImageAssets.leftArrowIc,
                            color: ColorManager.white,
                          )),
                      Text(
                        "Recharge or pay bill",
                        style: getSemiBoldStyle(
                            color: ColorManager.white, fontSize: FontSize.s18),
                      )
                    ],
                  ),
                ),
                //Balance Widget
                ExpansionTile(
                    title: Text("View Total Balance",
                        style: getRegularStyle(
                            color: const Color(0xFFA262A5),
                            fontSize: FontSize.s14)),
                    expandedAlignment: Alignment.centerLeft,
                    collapsedIconColor: ColorManager.white,
                    iconColor: ColorManager.white,
                    childrenPadding:
                        const EdgeInsets.only(left: AppPadding.p16),
                    children: [
                      Text(
                        "${accountDetails.accountBalance} ${accountDetails.accountBalanceCurrency}",
                        style: getBoldStyle(
                            color: ColorManager.secondary,
                            fontSize: FontSize.s28),
                      )
                    ]),
                Divider(
                  color: ColorManager.primary,
                  thickness: 1,
                  height: 5,
                ),
                ExpansionTile(
                  title: Text("View Shukria Wallet",
                      style: getRegularStyle(
                          color: const Color(0xFFA262A5),
                          fontSize: FontSize.s14)),
                  collapsedIconColor: ColorManager.white,
                  iconColor: ColorManager.white,
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: const EdgeInsets.only(left: AppPadding.p16),
                  children: [
                    Text(
                      "40 points",
                      style: getBoldStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s28),
                    )
                  ],
                ),
                kSizedBox5,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
