import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/screens/widgets/text_widget.dart';
import '../../../../../constant/color_manger.dart';
import '../../../../../constant/constants.dart';
import '../../../../../constant/style_manager.dart';
import '../../../../../constant/values_manger.dart';
import '../../../../../core/notifier/remittance/exchange_house_list_provider.dart';
import '../../../../../provider/beneficiary_select_notifier.dart';

class MoneyTextWidget extends HookWidget {
  const MoneyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendMoneyController = useTextEditingController();
    final receiveMoneyController = useTextEditingController();
    final selectedBeneficiary =
        Provider.of<BeneficiarySelectNotifier>(context, listen: true);
    final exchangeNotifier =
        Provider.of<ExchangeHouseListNotifier>(context, listen: true);
    return Row(
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
              TextFieldWidget(
                controller: sendMoneyController,
                keyboardType: TextInputType.number,
                onEditFunction: () {},
                onChanged: (value) {
                  receiveMoneyController.clear();
                  if (value.isNotEmpty) {
                    selectedBeneficiary.beneficiaryAmountCalculation(
                      double.parse(value),
                      exchangeNotifier.getProductModel!,
                    );
                  }

                  if (selectedBeneficiary.getReceiveAmount <= 0) {
                    receiveMoneyController.text = "";
                  } else {
                    receiveMoneyController.text =
                        selectedBeneficiary.getReceiveAmount.toStringAsFixed(2);
                  }
                },
                prefix: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p10),
                  child: Text("AED",
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
              TextFieldWidget(
                controller: receiveMoneyController,
                keyboardType: TextInputType.number,
                onEditFunction: () {},
                node: selectedBeneficiary.getFeeTierList != null &&
                        selectedBeneficiary.getMinFee != 0 &&
                        selectedBeneficiary.getMinFee != null
                    ? AlwaysDisabledFocusNode()
                    : null,
                onChanged: (value) {
                  sendMoneyController.clear();
                  if (value.isNotEmpty) {
                    selectedBeneficiary.beneficiaryReverseCalculation(
                        double.parse(value), exchangeNotifier.getProductModel!);

                    sendMoneyController.text =
                        selectedBeneficiary.getSendAmount.toStringAsFixed(2);
                  } else {
                    sendMoneyController.clear();
                  }
                },
                enableInteractiveSelection:
                    selectedBeneficiary.getFeeTierList != null &&
                            selectedBeneficiary.getMinFee != 0 &&
                            selectedBeneficiary.getMinFee != null
                        ? false
                        : true,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p10),
                  child: Text(
                    "INR",
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
        // Expanded(
        //   flex: 3,
        //   child: TextFieldWidget(
        //     controller: receiveMoneyController,
        //     onEditFunction: () {},
        //     prefix: Text("INR"),
        //     key: const ValueKey('theyReceived'),
        //     labelText: "They Received",
        //     onSave: (value) {
        //       receiveMoneyController.text = value!;
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
