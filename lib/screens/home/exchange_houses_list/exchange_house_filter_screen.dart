import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/widgets/custom_button.dart';

class ExchangeHouseFilterScreen extends StatefulWidget {
  const ExchangeHouseFilterScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeHouseFilterScreen> createState() => _ExchangeHouseFilterScreenState();
}

class _ExchangeHouseFilterScreenState extends State<ExchangeHouseFilterScreen> {

  static const List<String> chipList = [
    "All",
    "Al Rostamani Exchange",
    "Lulu Exchange",
    "Al Fardan Exchange",
  ];
  static const List<String> timeList = [
    "All",
    "2 hrs",
    "4 hrs",
    "16 - 24 hrs",
    "3 - 5 days",
    "1 week"
  ];

  static const List<String> feeList = [
    "All",
    "2 AED",
    "5 AED",
    "12 AED",
    "15 AED",
    "20 AED",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p16,
            ),
            child: SvgPicture.asset(
              ImageAssets.leftArrowIc,
            ),
          ),
        ),
        leadingWidth: 38,
        centerTitle: false,
        titleSpacing: 8,
        title: Text(
          "Filter",
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Row(
              children: [
                Icon(
                  Icons.close,
                  size: 14,
                  color: ColorManager.grey3,
                ),
                kSizedW7,
                Text(
                  "Close",
                  style: getRegularStyle(color: ColorManager.grey3),
                )
              ],
            ),
          ),
          kSizedW20,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBox30,
                  Text(
                    "Exchange Houses",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.black3),
                  ),
                  kSizedBox18,
                  FilterChipWidget(amountList: chipList),
                  kSizedBox20,
                  Text(
                    "Transfer Time",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.black3),
                  ),
                  kSizedBox18,
                  FilterChipWidget(amountList: timeList),

                  kSizedBox20,
                  Text(
                    "Transfer Fee",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.black3),
                  ),
                  kSizedBox18,
                  FilterChipWidget(amountList: feeList),
                  kSizedBox20,
                  Text(
                    "Custom Rating",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorManager.black3),
                  ),
                  kSizedBox18,
                ],
              ),
            ),
          )),
          Container(
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
              border: Border.all(color: ColorManager.grey5)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 46.h,
                    width:131.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ColorManager.grey5)
                    ),
                    child: Center(
                      child: Text("Cancel All",
                          style: getBoldStyle(
                              color: ColorManager.primary, fontSize: FontSize.s16)),
                    ),
                  ),
                ),
                CustomButton(onTap: (){}, width: 161, text: "Apply filter")
              ],
            ),
          )
        ],
      ),
    );
  }
}


class FilterChipWidget extends StatefulWidget {
  final List<String> amountList;

  const FilterChipWidget(
      {required this.amountList,
        Key? key})
      : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  String selectedChoice = "";
  bool isLoading = false;
  bool isFilter =false;

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.amountList) {
      choices.add(SizedBox(
          height: 40,
          child: FilterChip(
            avatarBorder: RoundedRectangleBorder(side: BorderSide(color: ColorManager.grey5)),
            label: Text(item),
            selected: selectedChoice==item,
            onSelected: (bool value){
              setState(() {
                selectedChoice=item;
              });
            },
            selectedColor: ColorManager.quaternary,
            labelStyle: selectedChoice==item?getBoldStyle(color: ColorManager.white,fontSize: FontSize.s14):getRegularStyle(color: ColorManager.black,fontSize: FontSize.s14),
            backgroundColor: ColorManager.white,
            checkmarkColor: Colors.white,
            showCheckmark: true,
          )
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: _buildChoiceList(),
    );
  }
}
