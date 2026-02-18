import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/values_manger.dart';
import '../../../../../constant/constants.dart';
import '../../../../../core/notifier/beneficiary/beneficiary_list_notifier.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../provider/beneficiary_select_notifier.dart';
import '../../../../../widgets/circular_indicator_widget.dart';
import '../../../pay_beneficiary/beneficiary_details_screen.dart';
import '../main_money_transfer_widget.dart';
import 'circle_add_widget.dart';
import 'circle_beneficiary_widget.dart';

class BeneficiaryListWidget extends StatelessWidget {
  const BeneficiaryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary =
        Provider.of<BeneficiarySelectNotifier>(context, listen: false);
    return Column(
      children: [
        Container(
          height: 145.h,
          width: double.infinity,
          padding: EdgeInsets.only(top: AppPadding.p10.h),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.quaternary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: AppPadding.p12.w),
                child: Text(
                  S.of(context).sendMoney,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.black),
                ),
              ),
              kSizedBox10,
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p12),
                child: SizedBox(
                  height: 100.h,
                  child: Consumer<BeneficiaryListNotifier>(
                      builder: (context, data, child) {
                    return data.isLoading == true
                        ? const CircularIndicatorWidget()
                        : data.getTotalLength == 0
                            ? const CircleAddWidget()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.getTotalLength + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return const CircleAddWidget();
                                  }
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      if (selectedBeneficiary.getSendAmount <= 0) {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text("Please enter amount then choose beneficiary"),
                                          backgroundColor: Colors.red,
                                        ));
                                        return;
                                      }
                                      if (selectedBeneficiary
                                              .getBeneficiaryId ==
                                          data.getBeneficiaryModel!
                                              .result![index - 1].id) {
                                        selectedBeneficiary.setBeneficiaryId =
                                            "deSelected";
                                      } else {
                                        selectedBeneficiary.selectedBeneficiary(
                                          data.getBeneficiaryModel!
                                              .result![index - 1],
                                        );
                                      }
                                    },
                                    child: CircleBeneficiaryWidget(
                                      beneficiaryId: data.getBeneficiaryModel!
                                          .result![index - 1].id,
                                      beneficiaryImage: data
                                          .getBeneficiaryModel!
                                          .result![index - 1]
                                          .logo
                                          .toString(),
                                      beneficiaryName: data
                                          .getBeneficiaryModel!
                                          .result![index - 1]
                                          .beneficiaryNickName
                                          .toString(),
                                    ),
                                  );
                                });
                  }),
                ),
              ),
            ],
          ),
        ),
        kSizedBox15,
        //Send Button Widget
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: RoundedButtonWidget(
            buttonText: S.of(context).sendMoney,
            onPressed: () {
              if (selectedBeneficiary.getReceiveAmount <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please send valid amount"),
                  backgroundColor: Colors.red,
                ));
              } else if (selectedBeneficiary.getBeneficiaryId == null ||
                  selectedBeneficiary.getBeneficiaryId == "deSelected") {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please select a beneficiary"),
                  backgroundColor: Colors.red,
                ));
              } else {
                FocusManager.instance.primaryFocus?.unfocus();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>const  BeneficiaryDetailsScreen()));
              }
            },
          ),
        ),
      ],
    );
  }
}
