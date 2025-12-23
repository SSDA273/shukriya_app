import 'package:flutter/material.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({Key? key,required this.mainText,required this.subText}) : super(key: key);
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actionsPadding: EdgeInsets.only(right: 20,bottom: 10),
            title: Icon(Icons.error_outline,
              size: 60,
              color: Colors.red,),
            content: Container(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(mainText,
                    style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s16),),
                  SizedBox(height: 10,),
                  Text(subText, style: getRegularStyle(color:ColorManager.black,fontSize: FontSize.s14)),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: ()=>Navigator.pop(context), child: Text("ok",
    style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s16)))
            ],
          );
  }
}
