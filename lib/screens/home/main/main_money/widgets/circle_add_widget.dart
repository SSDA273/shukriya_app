import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import '../../../../../constant/app_routes.dart';
import '../../../../../generated/l10n.dart';

class CircleAddWidget extends StatelessWidget {

  const CircleAddWidget({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushNamed(context, addBeneficiaryRoute);
      },
      child: Padding(
        padding: const EdgeInsets.only(right:AppPadding.p20),
        child: Column(
          children: [
            DottedBorder(
              borderType: BorderType.Circle,
              color: ColorManager.quaternary,
              dashPattern:const  [5,8],
              padding:const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorManager.quaternary,
                child: Icon(Icons.add,
                color: ColorManager.white,),
              ),
            ),
            kSizedBox8,
            SizedBox(
              width: 62.w,
              child: Text(S.of(context).addnew,
                  textAlign: TextAlign.center,
                  style: getSemiBoldStyle(color: ColorManager.grey)),
            )
          ],
        ),
      ),
    );
  }
}
