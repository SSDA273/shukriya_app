import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/screens/widgets/text_widget.dart';
import '../../../../../constant/asset_manager.dart';
import '../../../../../constant/color_manger.dart';
import '../../../../../constant/constants.dart';
import '../../../../../constant/style_manager.dart';
import '../../../../../constant/values_manger.dart';
import '../../../../../core/notifier/remittance/currency_list_notifier.dart';
import '../../../../../core/notifier/remittance/exchange_house_list_provider.dart';
import '../../../../../core/notifier/remittance/fee_calculation_notifier.dart';
import '../../../../../provider/beneficiary_select_notifier.dart';
import '../../../../../widgets/circular_indicator_widget.dart';
import '../../../../../constant/api_const/app_api.dart';
import '../../../../../widgets/biller_image_widget.dart';

class CurrencySelectionWidget extends HookWidget {
  const CurrencySelectionWidget({Key? key}) : super(key: key);

  Widget _buildFlagImage(String? flagUrl, {double width = 32, double height = 24}) {
    return BillerImage(
      imageKey: flagUrl,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sendMoneyController = useTextEditingController();
    final receiveMoneyController = useTextEditingController();
    final selectedBeneficiary =
    Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    final feeCalculation = Provider.of<FeeCalculationNotifier>(context, listen: false);
    final getExchangesNotifier =
    Provider.of<ExchangeHouseListNotifier>(context, listen: false);
    final fromCode = useValueNotifier("");
    final fromImage = useValueNotifier("");
    final toCode = useValueNotifier("");
    final toImage = useValueNotifier("");
    return HookBuilder(builder: (context) {
      var fromCurrencyCode = useValueListenable(fromCode);
      var fromCurrencyImage = useValueListenable(fromImage);
      var toCurrencyCode = useValueListenable(toCode);
      var toCurrencyImage = useValueListenable(toImage);
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FROM",
                      style: getRegularStyle(
                        color: ColorManager.black,
                      ),
                    ),
                    kSizedBox5,
                    //Search Dropdown Widget

                    // Consumer<CurrencyListNotifier>(
                    //     builder: (context, snapshot, child) {
                    //   return DropdownSearch<String>(
                    //
                    //     popupProps: PopupProps.menu(
                    //
                    //       searchFieldProps: TextFieldProps(
                    //           style: getSemiBoldStyle(
                    //         color: ColorManager.black,
                    //       )),
                    //       showSelectedItems: true,
                    //       menuProps: MenuProps(
                    //           barrierLabel: "Select Country",
                    //           backgroundColor: Colors.white,
                    //
                    //           textStyle:
                    //               getSemiBoldStyle(color: ColorManager.red)),
                    //       textStyle:
                    //           getSemiBoldStyle(color: ColorManager.black),
                    //       // disabledItemFn: (String s) => s.startsWith('I'),
                    //       showSearchBox: true,
                    //
                    //     ),
                    //     items: snapshot.getCurrencyModel!.result!.map((e) {
                    //       return e.currencyCode!;
                    //     }).toList(),
                    //     dropdownDecoratorProps: DropDownDecoratorProps(
                    //       dropdownSearchDecoration:InputDecoration(
                    //         prefix: Text("sdf"),
                    //         labelText: "Menu mode",
                    //         prefixStyle: getSemiBoldStyle(color: ColorManager.black),
                    //         hintText: "country in menu mode",
                    //         suffixStyle: getSemiBoldStyle(color: ColorManager.black)
                    //       ),
                    //
                    //         baseStyle: getSemiBoldStyle(color: ColorManager.red)),
                    //
                    //     onChanged: print,
                    //     enabled: true,
                    //     selectedItem: "Brazil",
                    //     dropdownButtonProps: DropdownButtonProps(color: Colors.red),
                    //   );
                    // }),

                    Consumer<CurrencyListNotifier>(
                        builder: (context, snapshot, child) {
                          final result = snapshot.getCurrencyModel?.result ?? [];
                          if (snapshot.isLoading == true) {
                            return const CircularIndicatorWidget();
                          }
                          if (result.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          // Find AED or fallback to first
                          final defaultFromItem = result.firstWhere(
                                (e) => e.currencyCode == "AED",
                            orElse: () => result.first,
                          );

                          // Handle potential duplicates and nulls for dropdown keys
                          final uniqueItems = <String>{};
                          final dropdownItems = result.where((item) {
                            if (item.currencyCode == null || item.currencyCode!.isEmpty) return false;
                            return uniqueItems.add(item.currencyCode!);
                          }).map((item) {
                            return DropdownMenuItem<String>(
                              value: item.currencyCode,
                              onTap: () {
                                fromImage.value = item.countryFlag ?? "";
                                fromCode.value = item.currencyCode ?? "";
                                sendMoneyController.clear();
                                receiveMoneyController.clear();
                                selectedBeneficiary.selectCountry(
                                  toCode.value.isEmpty ? "INR" : toCode.value,
                                  item.currencyCode.toString(),
                                );
                                getExchangesNotifier.getExchangeHouseList(
                                  context: context,
                                  fromCurrency: item.currencyCode.toString(),
                                  toCurrency: toCode.value.isEmpty ? "INR" : toCode.value,
                                );
                              },
                              child: Text(
                                item.currencyCode.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          }).toList();

                          // Ensure current value exists in items
                          final currentFromValue = fromCode.value.isEmpty ? defaultFromItem.currencyCode : fromCurrencyCode;
                          final verifiedFromValue = dropdownItems.any((item) => item.value == currentFromValue)
                              ? currentFromValue
                              : defaultFromItem.currencyCode;

                          return DropdownButtonFormField<String>(
                            menuMaxHeight: 200,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorManager.grey5, width: 1)),
                              contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              prefixIconConstraints: const BoxConstraints(minWidth: 50),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.grey5),
                              ),
                              floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.grey5),
                              ),
                              prefixIcon: _buildFlagImage(
                                fromImage.value.isEmpty ? defaultFromItem.countryFlag : fromCurrencyImage,
                              ),
                            ),
                            value: verifiedFromValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: dropdownItems,
                            onChanged: (_) {},
                          );
                        }),
                  ],
                ),
              ),
              kSizedW10,
              //Todo: Currently Currency swap is disabled. Uncomment when client says to add that features.
              Column(
                children: [
                  kSizedBox15,
                  // GestureDetector(
                  //   onTap: () {
                  //     sendMoneyController.clear();
                  //     receiveMoneyController.clear();
                  //     var temp =
                  //         fromCode.value.isEmpty ? "AED" : fromCode.value;
                  //     var tempImage = fromImage.value.isEmpty
                  //         ? "https://flagcdn.com/16x12/ae.png"
                  //         : fromImage.value;
                  //     fromCode.value =
                  //         toCode.value.isEmpty ? "INR" : toCode.value;
                  //     fromImage.value = toImage.value.isEmpty
                  //         ? "https://flagcdn.com/16x12/in.png"
                  //         : toImage.value;
                  //     toCode.value = temp;
                  //     toImage.value = tempImage;
                  //     print("temp is $temp");
                  //     print("Now From is ${fromCode.value}");
                  //     print("Now To is ${toCode.value}");
                  //
                  //     getExchangesNotifier.getExchangeHouseList(
                  //         context: context,
                  //         fromCurrency: fromCode.value,
                  //         toCurrency: toCode.value);
                  //     selectedBeneficiary.selectCountry(
                  //         toCode.value, fromCode.value);
                  //   },
                  //   child:
                  SvgPicture.asset(
                    ImageAssets.changeIcon,
                    height: 24,
                    width: 24,
                  ),
                  // ),
                ],
              ),
              kSizedW10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TO",
                      style: getRegularStyle(
                        color: ColorManager.black,
                      ),
                    ),
                    kSizedBox5,
                    Consumer<CurrencyListNotifier>(
                        builder: (context, snapshot, child) {
                          final result = snapshot.getCurrencyModel?.result ?? [];
                          if (snapshot.isLoading == true) {
                            return const CircularIndicatorWidget();
                          }
                          if (result.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          // Find INR or fallback to first
                          final defaultToItem = result.firstWhere(
                                (e) => e.currencyCode == "INR",
                            orElse: () => result.first,
                          );

                          // Handle potential duplicates and nulls for dropdown keys
                          final uniqueItems = <String>{};
                          final dropdownItems = result.where((item) {
                            if (item.currencyCode == null || item.currencyCode!.isEmpty) return false;
                            return uniqueItems.add(item.currencyCode!);
                          }).map((item) {
                            return DropdownMenuItem<String>(
                              value: item.currencyCode,
                              onTap: () {
                                toImage.value = item.countryFlag ?? "";
                                toCode.value = item.currencyCode ?? "";
                                sendMoneyController.clear();
                                receiveMoneyController.clear();
                                selectedBeneficiary.selectCountry(
                                    item.currencyCode.toString(), fromCode.value);
                                getExchangesNotifier.getExchangeHouseList(
                                    context: context,
                                    fromCurrency: fromCode.value.isEmpty ? "AED" : fromCode.value,
                                    toCurrency: item.currencyCode.toString());
                              },
                              child: Text(
                                item.currencyCode.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          }).toList();

                          // Ensure current value exists in items
                          final currentToValue = toCode.value.isEmpty ? defaultToItem.currencyCode : toCurrencyCode;
                          final verifiedToValue = dropdownItems.any((item) => item.value == currentToValue)
                              ? currentToValue
                              : defaultToItem.currencyCode;

                          return DropdownButtonFormField<String>(
                            menuMaxHeight: 200,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorManager.grey5, width: 1)),
                              contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              prefixIconConstraints: const BoxConstraints(minWidth: 50),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.grey5),
                              ),
                              floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.grey5),
                              ),
                              prefixIcon: _buildFlagImage(
                                toImage.value.isEmpty ? defaultToItem.countryFlag : toCurrencyImage,
                              ),
                            ),
                            value: verifiedToValue,
                            items: dropdownItems,
                            onChanged: (_) {},
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
          kSizedBox32,
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "YOU SEND",
                      style: getRegularStyle(
                        color: ColorManager.black,
                      ),
                    ),
                    kSizedBox5,
                    TextFieldWidget(
                      controller: sendMoneyController,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      onEditFunction: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        sendMoneyController.text=amountFormatter.format(double.parse(sendMoneyController.text));
                      },
                      onChanged: (value) async {
                        if (value.isNotEmpty) {
                          double amount = double.tryParse(value) ?? 0.0;
                          if (getExchangesNotifier.getProductModel != null) {
                            selectedBeneficiary.beneficiaryAmountCalculation(
                              amount,
                              getExchangesNotifier.getProductModel!,
                            );
                            
                            // Preliminary calculation for real-time update
                            double preliminaryReceiveAmount = (amount - selectedBeneficiary.getTransferFee) * selectedBeneficiary.getExchangeRate;
                            receiveMoneyController.text = amountFormatter.format(preliminaryReceiveAmount);

                            try {
                              await feeCalculation.getRemittanceFee(
                                context: context,
                                feeFxId: selectedBeneficiary.getFeeFxID ?? "",
                                amount: selectedBeneficiary.getSendAmount,
                                commissionType: "customer",
                                fromCurrency: getExchangesNotifier.getExchangeHouseModel?.result?[0].products?[0].fee?.fromCurrency ?? "AED",
                                toCurrency: getExchangesNotifier.getExchangeHouseModel?.result?[0].products?[0].fee?.toCurrency ?? "INR",
                                serviceId: selectedBeneficiary.getServiceID ?? "",
                                toCountry: selectedBeneficiary.getToCountry ?? "IN",
                              );

                              double fee = double.tryParse(feeCalculation.getTotalFee) ?? 0.0;
                              selectedBeneficiary.setReceiveAmount = fee;
                              selectedBeneficiary.setTransferFee = fee;
                              
                              // Update with final amount after fee deduction if that's the logic
                              receiveMoneyController.text = amountFormatter.format(selectedBeneficiary.getReceiveAmount);
                            } catch (e) {
                              print("Fee calculation error: $e");
                              // Keep the preliminary amount if fee calculation fails
                            }
                          }
                        } else {
                          receiveMoneyController.text = "0.00";
                          selectedBeneficiary.setTransferFee = 0.00;
                        }
                      },

                      prefix: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10),
                        child: Text(
                            fromCode.value.isEmpty ? "AED" : fromCurrencyCode,
                            style: getRegularStyle(color: ColorManager.grey)),
                      ),
                      key: const ValueKey('youSend'),
                      // hint: "You Send",
                      onSave: (value) {
                        sendMoneyController.text = value!;
                      },
                    ),
                  ],
                ),
              ),
              kSizedW15,
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "THEY RECEIVE",
                      style: getRegularStyle(
                        color: ColorManager.black,
                      ),
                    ),
                    kSizedBox5,
                    TextFieldWidget(
                      controller: receiveMoneyController,
                      keyboardType: TextInputType.number,
                      onEditFunction: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // node: selectedBeneficiary.getFeeTierList != null &&
                      //         selectedBeneficiary.getMinFee != 0 &&
                      //         selectedBeneficiary.getMinFee != null
                      //     ? AlwaysDisabledFocusNode()
                      //     : null,
                      onChanged: (value) {
                        sendMoneyController.clear();
                        // if (value.isNotEmpty) {
                        //   selectedBeneficiary.beneficiaryReverseCalculation(
                        //       double.parse(value),
                        //       getExchangesNotifier.getProductModel!);
                        //
                        //   sendMoneyController.text = selectedBeneficiary
                        //       .getSendAmount
                        //       .toStringAsFixed(2);
                        // } else {
                        //   sendMoneyController.clear();
                        // }
                      },
                      // enableInteractiveSelection:
                      //     selectedBeneficiary.getFeeTierList != null &&
                      //             selectedBeneficiary.getMinFee != 0 &&
                      //             selectedBeneficiary.getMinFee != null
                      //         ? false
                      //         : true,
                      enableInteractiveSelection: false,
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10),
                        child: Text(
                          toCode.value.isEmpty ? "INR" : toCurrencyCode,
                          style: getRegularStyle(color: ColorManager.grey),
                        ),
                      ),
                      key: const ValueKey('youSend'),
                      // hint: "You Send",
                      onSave: (value) {
                        receiveMoneyController.text = value!;
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}


