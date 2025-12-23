import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';

import '../../../../../constant/api_const/app_api.dart';
import '../../../../../constant/asset_manager.dart';
import '../../../../../constant/values_manger.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../models/exchange_house_model/exchange_product_model.dart';

class LatestExchangeHouseWidget extends StatelessWidget {
  const LatestExchangeHouseWidget({
    required this.exchangeProductModel,
    Key? key,
  }) : super(key: key);
  final ExchangeProductModel? exchangeProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).conversionRate,
                style: getRegularStyle(color: ColorManager.grey),
              ),
              Text(S.of(context).transferFee,
                  style: getRegularStyle(color: ColorManager.grey)),
            ],
          ),
          kSizedBox4,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "1 AED", //Todo: Change when base currency added
                    style: getRegularStyle(color: ColorManager.black)),
                TextSpan(
                    text:
                        " = ${exchangeProductModel?.fee?.fxRate} ${exchangeProductModel?.fee?.toCurrency}",
                    style: getBoldStyle(color: ColorManager.black)),
              ])),
              Text(
                  "${exchangeProductModel?.fee?.feeFlat} AED", //Todo: Change when base currency added
                  style: getBoldStyle(color: ColorManager.black))
            ],
          ),
          kSizedBox10,
          MySeparator(color: ColorManager.secondary),
          kSizedBox5,
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p2),
            child: Row(
              children: [
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xFFEFEFEF)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${AppAPI.baseUrl}/files?key=${exchangeProductModel?.logo ?? ""}"),
                          fit: BoxFit.cover)),
                ),
                kSizedW20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exchangeProductModel?.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(color: ColorManager.grey),
                    ),
                    kSizedBox4,
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.starIc,
                        ),
                        kSizedW5,
                        Text(
                          "4.5",
                          style: getRegularStyle(
                              color: ColorManager.secondaryDark),
                        ),
                        kSizedW10,
                        SvgPicture.asset(
                          ImageAssets.clockIc,
                        ),
                        kSizedW5,
                        Text(
                          "2 days",
                          style: getRegularStyle(
                              color: ColorManager.secondaryDark),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: ColorManager.primary),
                    ))),
                    onPressed: () {},
                    child: Text("Select",
                        style: getSemiBoldStyle(color: ColorManager.primary)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
