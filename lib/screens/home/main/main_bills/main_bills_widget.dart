import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/extension/color_extension.dart';
import 'package:unitey_app/screens/home/add_bills/add_bills_screen.dart';
import '../../../../constant/api_const/app_api.dart';
import '../../../../constant/color_manger.dart';
import '../../../../core/notifier/bill/bill_list_notifier.dart';
import '../../../../core/notifier/billers/billers_list_notifier.dart';
import '../../../../generated/l10n.dart';
import '../../../../provider/biller_select_notifier.dart';
import '../../../../widgets/circular_indicator_widget.dart';
import '../../../../widgets/biller_image_widget.dart';
import '../../pay_bills/pay_bill_amount_screen.dart';

class MainBillsWidget extends StatelessWidget {
  const MainBillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BillsSelectionNotifier selectBiller =
    Provider.of<BillsSelectionNotifier>(context, listen: false);
    return Container(
      margin:const EdgeInsets.only(top: AppMargin.m8,bottom: AppMargin.m12) ,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Add Bills Section
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width:170.w,
                  child: Text(S.of(context).payWinPoints,
                  style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s20),),
                ),
                Spacer(),
                Flexible(
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AddBillsScreen()));
                  }, child: Text(S.of(context).add,
                    style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s14).copyWith(decoration: TextDecoration.underline),)),
                )
              ],
            ),
          ),
          kSizedBox10,
          //Subtitle
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p16),
            child: Text(S.of(context).useWalletToShop,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          kSizedBox14,
          //Bills List Section
          SizedBox(
            height: 120.h,
            child: Consumer<BillerListNotifier>(builder: (context, data, _) {
              return data.isLoading == true
                  ? const CircularIndicatorWidget()
                  : data.getTotalLength == 0
                  ?
              //    bills Subcategory list
              Consumer<BillListNotifier>(builder: (context, billList, _) {
                return billList.isLoading == true
                    ? const CircularIndicatorWidget()
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: AppPadding.p16.w),
                  itemCount: billList.getTotalLength,
                  itemBuilder: (context, index) {
                    final bills =
                    billList.getBillerModel!.result![index];
                    return InkWell(
                        onTap: () {
                          selectBiller.selectedBill(
                            billList
                                .getBillerModel!.result![index],
                          );
                          // todo: dynamic textfield
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             PaySubCategory(
                          //               productModel:
                          //               bills.products!,
                          //             ),
                          //     ));
                        },
                        child: Container(
                          width: 122.w,
                          height: 114.h,
                          margin: EdgeInsets.only(right: AppPadding.p16),
                          decoration:BoxDecoration(
                            color: HexColor.fromHex(bills.branding?.secondary??"#FBF2FD"),
                            borderRadius: BorderRadius.circular(12)
                          ) ,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.w,
                                width:40.w,
                                padding: const EdgeInsets.symmetric(vertical: AppPadding.p9,horizontal: AppPadding.p10),
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(12),
                                    color: ColorManager.white
                                ),
                                child: BillerImage(
                                  imageKey: bills.logo,
                                  height: 40.w,
                                  width: 40.w,
                                ),
                              ),
                              kSizedBox5,
                              SizedBox(
                                width: 76.w,
                                child: Text(
                                  bills.name ?? "",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style:getBoldStyle(color: HexColor.fromHex(bills.branding?.primary??"#7B3884"),fontSize: FontSize.s14),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                );
              })
                  :
              //    billers list
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: AppPadding.p16.w),
                itemCount: data.getTotalLength,
                itemBuilder: (context, index) {
                  final product =
                  data.getBillersList!.result![index].productId!;
                  return InkWell(
                      onTap: () {
                        // todo: dynamic textfield
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PayBillerScreen(
                        //   productModel: data.getBillersList!.result![index].productId!,
                        //   title: data.getBillersList!.result![index].billerName.toString())));
                        if (product.configurations!.shortcode ==
                            'MBR') {
                          print(data.getBillersList!.result![index].serviceID);
                          selectBiller.selectedBiller(
                              data.getBillersList!.result![index]);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PayBillAmountScreen()
                              //     MobileAmountScreen(
                              //   enteredNumber: data
                              //       .getBillersList!
                              //       .result![index]
                              //       .billerAccountNumber!,
                              //   type: "billers",
                              // )
                          ));
                        } else {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         ElectricityBillDetailsScreen(
                          //           productName:
                          //           product.name.toString(),
                          //           amount: 1200,
                          //           name: data.getBillersList!
                          //               .result![index].billerName!,
                          //           accountNumber: data
                          //               .getBillersList!
                          //               .result![index]
                          //               .billerAccountNumber!,
                          //           image: product.logo!,
                          //         )));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: AppPadding.p12),
                        // width: 72.w, Todo:uncomment when you want particular width
                        child: Column(
                          children: [
                            BillerImage(
                              imageKey: data.getBillersList!.result![index].productId!.logo,
                              height: 73.h,
                              width: 72.w,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Flexible(
                              child: Text(
                                data.getBillersList!.result![index]
                                    .billerNickName ??
                                    "",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall,
                              ),
                            )
                          ],
                        ),
                      ));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
