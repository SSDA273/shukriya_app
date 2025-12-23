import 'package:flutter/material.dart';
import 'package:unitey_app/constant/color_manger.dart';

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: ColorManager.primary,
        valueColor:  AlwaysStoppedAnimation<Color>(ColorManager.white),
      ),
    );
  }
}
