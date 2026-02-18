import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:unitey_app/core/notifier/bill/bill_list_notifier.dart';
import 'package:unitey_app/core/notifier/billers/recent_billers_notifier.dart';
import 'package:unitey_app/extension/color_extension.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/widgets/text_field_widget.dart';
import 'package:unitey_app/widgets/biller_image_widget.dart';

import 'enter_number_screen.dart';

class SubCategoryScreen extends HookWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchController = useTextEditingController();
    final  selectBiller =
    Provider.of<BillsSelectionNotifier>(context, listen: false);
    final subCategoryNotifier = Provider.of<BillListNotifier>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:Center(child: InkWell(
          onTap: ()=>Navigator.pop(context),
            child: SvgPicture.asset(ImageAssets.leftArrowIc,))),
        actions: [
          SvgPicture.asset(ImageAssets.subMenuIc,),
          kSizedW10
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: TextFormField(
              style: getSemiBoldStyle(color: ColorManager.black),
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,right: 10),
                suffixStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: SizedBox(
                  height: 22.w,
                    width: 22.w,
                    child: Center(child: SvgPicture.asset(ImageAssets.searchIc))),
                hintText: "Search Billers",
                hintStyle: getRegularStyle(color: ColorManager.grey4),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                fillColor: ColorManager.filledColor,
              filled: true),

            )
          ),
          kSizedBox16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Text("Payment Categories",
            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),),
          ),
          kSizedBox20,
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: AppPadding.p16.w),
              itemCount: subCategoryNotifier.getTotalLength,
              itemBuilder: (context, index) {
                final bills =
                subCategoryNotifier.getBillerModel!.result![index];
                return InkWell(
                    onTap: ()  {
                      //Todo: the beginning of business logic
                      selectBiller.selectedBill(
                        subCategoryNotifier
                            .getBillerModel!.result![index],
                      );
                      selectBiller.selectedBillProduct(subCategoryNotifier
                          .getBillerModel!.result![index].products![index]);
                       Provider.of<RecentBillersNotifier>(context,listen: false).getRecentBillerList(
                          context: context, serviceSubcategoryId: subCategoryNotifier
                          .getBillerModel!.result![index].products![index].serviceSubCategoryId!);
                      // todo: dynamic textfield
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                               EnterMobileNumberScreen(
                                 productModel:
                                 bills.products!,
                               )));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 72.w,
                          height: 73.h,
                          // margin: EdgeInsets.only(right: AppPadding.p16),
                          decoration:BoxDecoration(
                              color: HexColor.fromHex(bills.branding?.secondary??"#FBF2FD"),
                              borderRadius: BorderRadius.circular(12)
                          ) ,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: AppPadding.p20,horizontal: AppPadding.p20),
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(12),
                                color: ColorManager.white
                            ),
                            child: BillerImage(imageKey: bills.logo),
                          ),
                        ),
                        SizedBox(
                          width: 76.w,
                          child: Text(
                            bills.name ?? "",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style:getSemiBoldStyle(color: ColorManager.grey2,fontSize: FontSize.s14),
                          ),
                        )
                      ],
                    ));
              },
            ),
          )

        ],
      )
    );
  }
}
