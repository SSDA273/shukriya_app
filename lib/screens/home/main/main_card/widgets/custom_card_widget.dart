import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant/asset_manager.dart';
import '../../../../../constant/font_manager.dart';
import '../../../../../core/notifier/account_details_notifier.dart';
import '../../../../../widgets/circular_indicator_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppMargin.m16, right: AppMargin.m16),
      height: 184.h,
      width: 328.w,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage("assets/images/c.jpg"), fit: BoxFit.cover),
      ),
      child:
          Consumer<AccountDetailsNotifier>(builder: (context, snapshot, child) {
        return snapshot.isLoading == true
            ? const Center(child: CircularIndicatorWidget())
            : Padding(
                padding: const EdgeInsets.fromLTRB(AppPadding.p20,
                    AppPadding.p24, AppPadding.p20, AppPadding.p20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/fardan.png",
                          width: 130,
                        ),
                        SvgPicture.asset(
                          ImageAssets.cardChip,
                          height: 29.h,
                          width: 42.w,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "${snapshot.getAccountDetailsModel!.result!.data.accountNumberLast4} \n",
                                  style: Theme.of(context).textTheme.titleMedium),
                              TextSpan(
                                  text: snapshot.getAccountDetailsModel!.result!
                                      .data.accountName,
                                  style: getRegularStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/mercury.jpeg",
                              width: 35,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot
                                  .getAccountDetailsModel!.result!.data.expiry,
                              style: getRegularStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s14),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
      }),
    );
  }
}

class FirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 328;
    final double _yScaling = size.height / 184;
    path.lineTo(127.828 * _xScaling, 19.0514 * _yScaling);
    path.cubicTo(
      28.8614 * _xScaling,
      60.2367 * _yScaling,
      1.7537 * _xScaling,
      138.51 * _yScaling,
      0.570687 * _xScaling,
      172.499 * _yScaling,
    );
    path.cubicTo(
      8.04548 * _xScaling,
      176.024 * _yScaling,
      48.6117 * _xScaling,
      181.88 * _yScaling,
      160.135 * _xScaling,
      138.504 * _yScaling,
    );
    path.cubicTo(
      267.654 * _xScaling,
      96.6848 * _yScaling,
      275.814 * _xScaling,
      12.4086 * _yScaling,
      265.083 * _xScaling,
      -28.3538 * _yScaling,
    );
    path.cubicTo(
      260.567 * _xScaling,
      -29.7126 * _yScaling,
      226.795 * _xScaling,
      -22.134 * _yScaling,
      127.828 * _xScaling,
      19.0514 * _yScaling,
    );
    path.cubicTo(
      127.828 * _xScaling,
      19.0514 * _yScaling,
      127.828 * _xScaling,
      19.0514 * _yScaling,
      127.828 * _xScaling,
      19.0514 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 328;
    final double _yScaling = size.height / 184;
    path.lineTo(136.434 * _xScaling, 9.1848 * _yScaling);
    path.cubicTo(
      42.0788 * _xScaling,
      31.9848 * _yScaling,
      6.77922 * _xScaling,
      97.6848 * _yScaling,
      0.923828 * _xScaling,
      127.685 * _yScaling,
    );
    path.cubicTo(
      7.11381 * _xScaling,
      131.852 * _yScaling,
      42.5807 * _xScaling,
      142.686 * _yScaling,
      148.48 * _xScaling,
      119.686 * _yScaling,
    );
    path.cubicTo(
      250.575 * _xScaling,
      97.5116 * _yScaling,
      269.77 * _xScaling,
      23.8517 * _yScaling,
      265.922 * _xScaling,
      -13.8152 * _yScaling,
    );
    path.cubicTo(
      262.074 * _xScaling,
      -15.6485 * _yScaling,
      230.79 * _xScaling,
      -13.6152 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
    );
    path.cubicTo(
      136.434 * _xScaling,
      9.1848 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ThirdClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 328;
    final double _yScaling = size.height / 184;
    path.lineTo(136.434 * _xScaling, 9.1848 * _yScaling);
    path.cubicTo(
      42.0788 * _xScaling,
      31.9848 * _yScaling,
      6.77922 * _xScaling,
      97.6848 * _yScaling,
      0.923828 * _xScaling,
      127.685 * _yScaling,
    );
    path.cubicTo(
      7.11381 * _xScaling,
      131.852 * _yScaling,
      42.5807 * _xScaling,
      142.686 * _yScaling,
      148.48 * _xScaling,
      119.686 * _yScaling,
    );
    path.cubicTo(
      250.575 * _xScaling,
      97.5116 * _yScaling,
      269.77 * _xScaling,
      23.8517 * _yScaling,
      265.922 * _xScaling,
      -13.8152 * _yScaling,
    );
    path.cubicTo(
      262.074 * _xScaling,
      -15.6485 * _yScaling,
      230.79 * _xScaling,
      -13.6152 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
    );
    path.cubicTo(
      136.434 * _xScaling,
      9.1848 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
      136.434 * _xScaling,
      9.1848 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
