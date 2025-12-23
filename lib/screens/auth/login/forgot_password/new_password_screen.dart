import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../core/notifier/auth/forgot/forgot_password_notifier.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/circular_indicator_widget.dart';
import '../../../../widgets/custom_button.dart';


class NewPasswordScreen extends HookWidget {
  const NewPasswordScreen({Key? key,
    required this.userName,
    required this.token,
  }) : super(key: key);

  final String token, userName;

  @override
  Widget build(BuildContext context) {
    final newPin = useTextEditingController();
    final rePin = useTextEditingController();

    final rePasswordFocus = useFocusNode();
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
          "Change Password",
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              kSizedBox24,
              Text(
                "Enter New Password",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
              ),
              kSizedBox10,
              PinCodeTextField(
                  controller: newPin,
                  // focusNode: passwordFocus,
                  appContext: context,
                  length: 6,
                  obscureText: true,
                  showCursor: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  autoDisposeControllers: false,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  animationType: AnimationType.fade,
                  cursorColor: ColorManager.primary,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 54.h,
                    fieldWidth: 47.w,
                    activeColor: ColorManager.primary,
                    inactiveColor: ColorManager.grey5,
                    selectedColor: ColorManager.primary,
                    selectedFillColor: ColorManager.filledColor,
                    inactiveFillColor: ColorManager.filledColor,
                    activeFillColor: ColorManager.filledColor,
                  ),
                  enableActiveFill: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).plsEnterValue;
                    }
                    return null;
                  },
                  onCompleted: (_) {
                    FocusManager.instance.primaryFocus
                        ?.requestFocus(rePasswordFocus);
                  },
                  onChanged: (value) {}),
              kSizedBox15,
              Text(
                "Re-enter New Password",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
              ),
              kSizedBox10,
              PinCodeTextField(
                  controller: rePin,
                  // focusNode: passwordFocus,
                  appContext: context,
                  length: 6,
                  obscureText: true,
                  showCursor: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  autoDisposeControllers: false,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  animationType: AnimationType.fade,
                  cursorColor: ColorManager.primary,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 54.h,
                    fieldWidth: 47.w,
                    activeColor: ColorManager.primary,
                    inactiveColor: ColorManager.grey5,
                    selectedColor: ColorManager.primary,
                    selectedFillColor: ColorManager.filledColor,
                    inactiveFillColor: ColorManager.filledColor,
                    activeFillColor: ColorManager.filledColor,
                  ),
                  enableActiveFill: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).plsEnterValue;
                    }
                    return null;
                  },
                  onChanged: (value) {}),
              kSizedBox35,
              Consumer<ForgotPasswordNotifier>(
                  builder: (context, snapshot,_) {
                    return snapshot.getIsLoading?const CircularIndicatorWidget():Center(
                        child: CustomButton(onTap: () async{
                          if(newPin.text != rePin.text){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter same password"),
                              backgroundColor: ColorManager.red,));
                          }else{
                            FocusManager.instance.primaryFocus?.unfocus();
                            await snapshot.changeUserPassword(
                                context: context,
                                password: newPin.text,
                              token: token
                            ).then((value) {
                              if(value != null){
                                Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                              }
                            });
                          }

                        }, width: 169.w, text: 'Update'));
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
