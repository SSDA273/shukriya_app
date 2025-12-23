import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/billers/add_billers.notifier.dart';
import 'package:unitey_app/core/notifier/billers/recent_billers_notifier.dart';
import 'package:unitey_app/core/notifier/otp_generate_notifier.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/models/bill_list_model/bill_product_model.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/screens/home/add_bills/biller_added_success_screen.dart';
import 'package:unitey_app/screens/home/pay_bills/pay_bill_amount_screen.dart';
import 'package:unitey_app/screens/home/widgets/custom_otp_screen.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import 'package:unitey_app/widgets/custom_button.dart';

class EnterMobileNumberScreen extends HookWidget {
  EnterMobileNumberScreen({Key? key, required this.productModel})
      : super(key: key);
  final List<BillProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    final mobileNumber = useTextEditingController();
    final nickName = useTextEditingController();
    final isLoading = useState<bool>(false);
    final isSelected = useState<String>("deSelected");
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final selectBill =
        Provider.of<BillsSelectionNotifier>(context, listen: true);
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    final addBiller = Provider.of<AddBillersNotifier>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16, vertical: AppPadding.p6),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //AppBar
                        Row(
                          children: [
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child:
                                    SvgPicture.asset(ImageAssets.leftArrowIc)),
                            kSizedW10,
                            Text("Add Biller",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.black)),
                          ],
                        ),
                        kSizedBox25,
                        Column(
                          children: [
                            Text(
                              "Enter Nick Name",
                              style: getRegularStyle(
                                  color: ColorManager.grey3,
                                  fontSize: FontSize.s14),
                            ),
                          ],
                        ),
                        kSizedBox10,
                        TextFormField(
                          controller: nickName,
                          style: getSemiBoldStyle(
                              color: ColorManager.black3,
                              fontSize: FontSize.s16),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: ColorManager.grey5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: ColorManager.grey5),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).plsEnterValue;
                            }
                            return null;
                          },
                        ),
                        kSizedBox20,
                        Text(
                          "Enter phone Number",
                          style: getRegularStyle(
                              color: ColorManager.grey3,
                              fontSize: FontSize.s14),
                        ),
                        kSizedBox10,
                        TextFormField(
                          controller: mobileNumber,
                          keyboardType: TextInputType.number,
                          style: getSemiBoldStyle(
                              color: ColorManager.black3,
                              fontSize: FontSize.s16),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: ColorManager.grey5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: ColorManager.grey5),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).plsEnterValue;
                            }
                            return null;
                          },
                        ),
                        kSizedBox20,
                        Text(
                          "Select the operator",
                          style: getRegularStyle(
                              color: ColorManager.grey3,
                              fontSize: FontSize.s14),
                        ),
                        kSizedBox15,
                        Container(
                          height: 100.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productModel.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (isSelected.value ==
                                        productModel[index].id) {
                                      isSelected.value = "deSelected";
                                    } else {
                                      isSelected.value =
                                          productModel[index].id!;
                                    }

                                    selectBill.selectedBillProduct(
                                        productModel[index]);
                                    // if(productModel[index].configurations!.shortcode == 'MBR'){
                                    //   Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => const MobileRechargeScreen(),),);
                                    // }
                                    // else if(productModel[index].configurations!.shortcode == 'EBP'){
                                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ElectricityBillDetailsScreen(name:productModel[index].name.toString(),image: productModel[index].logo??"", accountNumber: '', productName: '', amount: 100,)));
                                    // }
                                  },
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: isSelected.value ==
                                                  productModel[index].id
                                              ? CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor:
                                                      Color(0xFF27AE60)
                                                          .withOpacity(0.6),
                                                  child: SvgPicture.asset(
                                                      ImageAssets.selected))
                                              : kSizedBox,
                                          backgroundImage: NetworkImage(
                                              "${AppAPI.baseUrl}/files?key=${productModel[index].logo}"),
                                        ),
                                        // CircleAvatar(
                                        //   backgroundColor: Colors.black,
                                        //   child: Text(
                                        //     product.name![0].toString(),
                                        //   ),
                                        //   radius: 30,
                                        // ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          productModel[index].name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),

                        kSizedBox40,
                        //Button Widget
                        Center(
                          child: isLoading.value
                              ? const CircularIndicatorWidget()
                              : CustomButton(
                                  onTap: () async {
                                    if (isSelected.value == "deSelected") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text("Please select the operator"),
                                        backgroundColor: ColorManager.red,
                                      ));
                                    } else if (formKey.currentState
                                            ?.validate() ??
                                        false) {
                                      isLoading.value = true;
                                      selectBill.setMobileNumber =
                                          mobileNumber.text;
                                      selectBill.setBillerName = nickName.text;
                                      final response =
                                          await addBiller.addBillers(
                                        serviceId: selectBill.getBillServiceId!,
                                        productId: selectBill.getBillId!,
                                        context: context,
                                        billerTypeId: selectBill.getSubBillId!,
                                        billerCurrency: "AED",
                                        billerName: nickName.text,
                                        billerNickName: nickName.text,
                                        billerCity: "",
                                        billerCountryCode: "AED",
                                        billerAccountName: "",
                                        billerAccountNumber: mobileNumber.text,
                                      );
                                      isLoading.value = false;
                                      if (response == "Error") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor: Colors.red,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 20),
                                                content: Text(
                                                    "Name Already Exists")));
                                      } else {
                                        await otpGenerateNotifier.generateOTP(
                                            context: context,
                                            transactionId: response!);
                                        mobileNumber.clear();
                                        nickName.clear();
                                        isSelected.value =
                                            "deSelected"; //To deselect the operator
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CustomOTPScreen(
                                                        transactionId: response,
                                                        bgImage: ImageAssets.bg,
                                                        nextScreen:
                                                            const BillerAddedSuccessScreen())));
                                      }
                                      isLoading.value = false;
                                    }
                                  },
                                  width: 169,
                                  text: "Continue"),
                        ),
                        kSizedBox30,
                        //Recent Transactions
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: Text(
                            "Recent",
                            style: getSemiBoldStyle(
                                color: ColorManager.black3,
                                fontSize: FontSize.s16),
                          ),
                          children: [
                            SizedBox(
                              height: 250.h,
                              child: Consumer<RecentBillersNotifier>(
                                  builder: (context, snapshot, _) {
                                return ListView.separated(
                                  itemCount: snapshot.getRecentBillersList!
                                      .result!.recentMobileRecharge.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final recentDetails = snapshot
                                        .getRecentBillersList!
                                        .result!
                                        .recentMobileRecharge[index];
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.transparent,
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                "${AppAPI.baseUrl}/files?key=${recentDetails.products.productLogo}"),
                                          ),
                                        ),
                                        kSizedW12,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              recentDetails
                                                  .billers.billerNickName,
                                              style: getRegularStyle(
                                                  color: ColorManager.grey2),
                                            ),
                                            Text(
                                              recentDetails
                                                  .billers.billerAccountNumber,
                                              style: getBoldStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.s20),
                                            ),
                                            Text(
                                              "Recharged ${recentDetails.debitAmount}",
                                              style: getRegularStyle(
                                                  color: ColorManager.primary,
                                                  fontSize: FontSize.s14),
                                            ),
                                            Text(
                                              DateFormat("dd MMM yyyy,")
                                                  .add_jm()
                                                  .format(recentDetails
                                                      .updatedAt
                                                      .toLocal()),
                                              style: getRegularStyle(
                                                  color: ColorManager.grey2,
                                                  fontSize: FontSize.s10),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            selectBill.selectedFromRecentBiller(
                                                recentDetails);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PayBillAmountScreen()));
                                          },
                                          child: Container(
                                            height: 26.h,
                                            width: 76.w,
                                            decoration: BoxDecoration(
                                                color: ColorManager.primary,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: Text(
                                              "Repeat",
                                              style: getSemiBoldStyle(
                                                  color: ColorManager.white),
                                            )),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                );
                              }),
                            )
                          ],
                        ),
                        //Choose Title
                      ],
                    ),
                  ),
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
