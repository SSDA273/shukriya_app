import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import '../../../constant/constants.dart';
import '../../../constant/values_manger.dart';
import '../../../core/notifier/beneficiary/beneficiary_list_notifier.dart';
import '../../../provider/beneficiary_select_notifier.dart';
import '../../../widgets/circular_indicator_widget.dart';
import 'main_money/widgets/circle_add_widget.dart';
import 'main_money/widgets/circle_beneficiary_widget.dart';

class MainPeopleWidget extends StatelessWidget {
  const MainPeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.fromLTRB( AppMargin.m16,  AppMargin.m16, AppMargin.m16,  AppMargin.m8),
      padding: const EdgeInsets.only(top:AppPadding.p16,bottom:AppPadding.p12 ,left:AppPadding.p20 ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.grey5)),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("People",
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: ColorManager.black),),
          kSizedBox10,
          SizedBox(
            height: 90,
            child: Consumer<BeneficiaryListNotifier>(
                builder: (context, data, child) {
                  return data.isLoading == true
                      ? const CircularIndicatorWidget()
                      : data.getTotalLength == 0
                      ? Center(
                    child: Text(
                      "You Don't have Beneficiaries. Please add",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                      : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.getTotalLength+1,
                      itemBuilder: (context, index) {
                        if(index==0){
                          return const CircleAddWidget();
                        }
                        return GestureDetector(
                          onLongPress: () {},
                          onTap: () {
                            Provider.of<BeneficiarySelectNotifier>(
                                context,
                                listen: false)
                                .selectedBeneficiary(
                              data.getBeneficiaryModel!
                                  .result![index-1],
                            );
                            // setState(() {
                            //   stackIndex = 1;
                            // });
                          },
                          child: CircleBeneficiaryWidget(
                            beneficiaryId: data
                                .getBeneficiaryModel!
                                .result![index-1]
                                .id,
                            beneficiaryImage: data
                                .getBeneficiaryModel!
                                .result![index-1]
                                .logo
                                .toString(),
                            beneficiaryName: data.getBeneficiaryModel!
                                .result![index-1].beneficiaryNickName
                                .toString(),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
