import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/extension/string_extension.dart';

import '../../../../constant/asset_manager.dart';
import '../../../../constant/color_manger.dart';
import '../../../../constant/constants.dart';
import '../../../../constant/font_manager.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';
import '../../../../core/notifier/auth/forgot/forgot_otp_verify_notifier.dart';
import '../../../../core/notifier/auth/forgot/forgot_user_id_send_notifier.dart';

import '../../../../widgets/circular_indicator_widget.dart';
import '../../../../widgets/custom_button.dart';
import 'new_password_screen.dart';

class ForgotOTPScreen extends StatefulWidget {
  const ForgotOTPScreen(
      {Key? key, required this.mobileNumber, required this.userName})
      : super(key: key);
  final String mobileNumber, userName;

  @override
  State<ForgotOTPScreen> createState() => _ForgotOTPScreenState();
}

class _ForgotOTPScreenState extends State<ForgotOTPScreen> {
  late final TextEditingController otpNumber;
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
    otpNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpNumber.dispose();
    timer.cancel();
    super.dispose();
  }

  bool _isLoading = false;
  bool _isLoadingResend = false;

  @override
  Widget build(BuildContext context) {
    final otpValidation =
    Provider.of<ForgotOTPVerifyNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: ColorManager.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              AppBar().preferredSize.height,
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.otpIc,
                      height: 112.h,
                    ),
                    kSizedBox22,
                    Text(
                      "Confirm with OTP",
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s20),
                    ),
                    kSizedBox5,
                    Text(
                      "We have sent a verification code to\nyour number",
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s16),
                    ),
                    kSizedBox5,
                    enableResend
                        ? const SizedBox()
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This code will expire in  ",
                          style: getRegularStyle(
                              color: ColorManager.grey3,
                              fontSize: FontSize.s14),
                        ),
                        Text('0:$secondsRemaining',
                            style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14)),
                      ],
                    ),
                    kSizedBox22,
                    PinCodeTextField(
                        controller: otpNumber,
                        appContext: context,
                        length: 6,
                        obscureText: true,
                        showCursor: false,
                        autovalidateMode: AutovalidateMode.disabled,
                        autoDisposeControllers: false,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        animationType: AnimationType.fade,
                        cursorColor: ColorManager.primary,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 54.h,
                          fieldWidth: 47.w,
                          activeColor: ColorManager.primary,
                          inactiveColor: Colors.transparent,
                          selectedColor: ColorManager.primary,
                          selectedFillColor: ColorManager.filledColor,
                          inactiveFillColor: ColorManager.filledColor,
                          activeFillColor: ColorManager.filledColor,
                        ),
                        enableActiveFill: true,
                        onChanged: (value) {}),
                    kSizedBox40,
                    Text(
                      widget.mobileNumber
                          .maskNumber(widget.mobileNumber.length),
                      style: getSemiBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18),
                    ),
                    kSizedBox5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         "didn't receive OTP?",
                          style: getRegularStyle(
                              color: ColorManager.grey3,
                              fontSize: FontSize.s14),
                        ),
                        _isLoadingResend
                            ? const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: CircularIndicatorWidget(),
                        )
                            : TextButton(
                          onPressed: enableResend ? _resendCode : null,
                          child: Text(
                           "Resend",
                            style: getBoldStyle(
                                color: enableResend
                                    ? ColorManager.primary
                                    : ColorManager.grey3,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ],
                    ),
                    kSizedBox50,
                    _isLoading
                        ? const CircularIndicatorWidget()
                        : CustomButton(
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          FocusManager.instance.primaryFocus!.unfocus();
                          await otpValidation
                              .verifyOTP(
                              context: context,
                              userName: widget.userName,
                              otp: otpNumber.text)
                              .then((value) {
                            if (value !=null) {
                              setState(() {
                                _isLoading = false;
                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewPasswordScreen(
                                            userName: widget.userName,
                                            token: value,
                                          )));
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          });

                          setState(() {
                            _isLoading = false;
                          });
                        },
                          width: 169.w,
                          text: "Confirm"
                      ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _resendCode() async {
    final otpGenerateNotifier =
    Provider.of<ForgotUserIDSendNotifier>(context, listen: false);
    setState(() {
      _isLoadingResend = true;
    });
    await otpGenerateNotifier.userIDSendOTP(
        context: context, userId: widget.userName);
    otpNumber.clear();
    FocusManager.instance.primaryFocus!.unfocus();
    setState(() {
      _isLoadingResend = false;
      secondsRemaining = 60;
      enableResend = false;
    });
  }
}
