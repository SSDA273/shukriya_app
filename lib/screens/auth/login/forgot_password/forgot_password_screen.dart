import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../core/notifier/auth/forgot/forgot_user_id_send_notifier.dart';

import '../../../../widgets/circular_indicator_widget.dart';
import '../../../../widgets/custom_button.dart';
import 'forgot_otp_screen.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: ColorManager.black,
            )),
        leadingWidth: 30,
        centerTitle: false,
        title: Text(
          "Forget Password",
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p18),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Customer ID",
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.s16)),
              kSizedBox5,
              TextFormField(
                cursorColor: ColorManager.primary,
                style: getSemiBoldStyle(
                    color: ColorManager.black3,
                    fontSize: FontSize.s16),
                controller: username,
                autovalidateMode: AutovalidateMode.disabled,
                keyboardType: TextInputType.emailAddress,

                // obscureText: true,
                // textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the value";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.only(left: AppPadding.p12),
                  hintText: "Enter Customer ID",
                  focusColor: ColorManager.primary,
                  hintStyle:
                  getRegularStyle(color: ColorManager.grey4),
                  fillColor: ColorManager.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: ColorManager.black3),
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: ColorManager.black3),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),

              kSizedBox24,
              Consumer<ForgotUserIDSendNotifier>(
                  builder: (context, snapshot, _) {
                    return snapshot.getIsLoading
                        ? const CircularIndicatorWidget()
                        : Center(
                      child: CustomButton(
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              await snapshot.userIDSendOTP(
                                  context: context, userId: username.text).then((value) {
                                    if(value!=null){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotOTPScreen(
                                        mobileNumber: value,
                                        userName: username.text,
                                      )));
                                    }
                              });
                            }
                          },
                          width: 169.w,
                          text: "Next"),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Please enter the value";
    }
    return null;
  }
}
