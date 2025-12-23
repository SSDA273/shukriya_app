
import 'package:flutter/material.dart';

import '../../../constant/values_manger.dart';

class FirstAdsWidget extends StatelessWidget {
  const FirstAdsWidget({
    required this.height,
    required this.image,
    Key? key,
  }) : super(key: key);
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: AppMargin.m16,vertical:  AppMargin.m16),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image:  DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
    );
  }
}