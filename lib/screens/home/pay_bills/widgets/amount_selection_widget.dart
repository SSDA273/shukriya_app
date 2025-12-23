import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/bill/bill_service_fee_notifier.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import 'package:unitey_app/widgets/custom_button.dart';

import '../pay_bills_details_screen.dart';

class AmountSelectionWidget extends HookWidget {
  const AmountSelectionWidget({Key? key,this.type}) : super(key: key);
  final String? type;
  static const List<String> chipList = [
    "10",
    "50",
    "80",
    "100",
    "120",
    "150",
    "180",
    "200",
  ];

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final selectBiller =
    Provider.of<BillsSelectionNotifier>(context, listen: false);
    final billServiceFee =
    Provider.of<BillServiceFeeNotifier>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChoiceChipWidget(
          amountList: chipList,
          type: type,
          billsSelectionNotifier: selectBiller,
          billServiceFee: billServiceFee,
        ),
        kSizedBox20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Text(
            "Or enter another amount",
            style: getSemiBoldStyle(
                color: ColorManager.black3, fontSize: FontSize.s16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: TextField(
            controller: amountController,
            style: getSemiBoldStyle(
                color: ColorManager.black3, fontSize: FontSize.s16),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.grey5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.grey5),
                ),
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    amountController.clear();
                  },
                  icon: SvgPicture.asset(
                    ImageAssets.trashIc,
                  ),
                )),
            keyboardType: TextInputType.number,
          ),
        ),
        kSizedBox20,
        Center(
          child: CustomButton(
            width: 161,
            onTap: () async {
                selectBiller.selectAmount =
                    int.parse(amountController.text);
                await billServiceFee.getBillFee(
                  context: context,
                  serviceId:type=="newBills"? selectBiller.getBillServiceId!:selectBiller.getBillerServiceId!,
                  amount: double.parse(amountController.text),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PayBillsDetailsScreen(type: type,)));

            },
            text: "Continue",
          ),
        )
      ],
    );
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final List<String> amountList;
  final BillsSelectionNotifier billsSelectionNotifier;
  final BillServiceFeeNotifier billServiceFee;
  final String? type;

  const ChoiceChipWidget(
      {required this.amountList,
      required this.billsSelectionNotifier,
      required this.billServiceFee,
        this.type,
      Key? key})
      : super(key: key);

  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String selectedChoice = "";
  bool isLoading = false;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.amountList.forEach((item) {
      choices.add(ChoiceChip(
        label: isLoading?CircularProgressIndicator():Text("$item AED"),
        labelStyle: getBoldStyle(
            color: selectedChoice == item
                ? ColorManager.white
                : ColorManager.black,
            fontSize: FontSize.s14),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
                color: selectedChoice == item
                    ? ColorManager.white
                    : ColorManager.grey5)),
        backgroundColor: ColorManager.white,
        selectedColor: ColorManager.quaternary,
        selected: selectedChoice == item,
        onSelected: (selected) {
          showDialog(context: context, builder: (context){
            return const CircularIndicatorWidget();
          });
          setState(() {
            selectedChoice = item;
          });
          widget.billsSelectionNotifier.selectAmount = int.parse(item);
           widget.billServiceFee.getBillFee(
            context: context,
            serviceId:widget.type=="newBills"?widget.billsSelectionNotifier.getBillServiceId!: widget.billsSelectionNotifier.getBillerServiceId!,
            amount: double.parse(item),
          ).then((value) {
            Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PayBillsDetailsScreen(type: widget.type,)));
            });},
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:
            const EdgeInsets.only(right: AppPadding.p34, top: AppPadding.p16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 0, mainAxisExtent: 60),
        children: _buildChoiceList());
  }
}
