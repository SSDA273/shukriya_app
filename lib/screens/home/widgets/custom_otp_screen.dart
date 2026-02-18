import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/customer/customer_profile_notifier.dart';
import 'package:unitey_app/core/notifier/otp_generate_notifier.dart';
import 'package:unitey_app/core/notifier/otp_validation_notifier.dart';
import 'package:unitey_app/extension/string_extension.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/screens/main_screen.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';

class CustomOTPScreen extends StatefulWidget {
  const CustomOTPScreen(
      {Key? key,
      required this.transactionId,
      required this.bgImage,
      required this.nextScreen})
      : super(key: key);
  final String transactionId, bgImage;
  final Widget nextScreen;

  @override
  State<CustomOTPScreen> createState() => _CustomOTPScreenState();
}

class _CustomOTPScreenState extends State<CustomOTPScreen> {
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
        Provider.of<OTPValidationNotifier>(context, listen: false);
    final customerDetails =
        Provider.of<CustomerProfileNotifier>(context, listen: false);
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
                                      color: ColorManager.tertiary,
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
                      (customerDetails.getCustomerNumber ?? '').maskNumber(
                          (customerDetails.getCustomerNumber ?? '').length),
                      style: getSemiBoldStyle(
                          color: ColorManager.grey, fontSize: FontSize.s18),
                    ),
                    kSizedBox5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).didNotReceived,
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
                                  S.of(context).resendOTP,
                                  style: getBoldStyle(
                                      color: enableResend
                                          ? ColorManager.tertiary
                                          : ColorManager.grey3,
                                      fontSize: FontSize.s14),
                                ),
                              ),
                      ],
                    ),
                    kSizedBox50,
                    _isLoading
                        ? const CircularIndicatorWidget()
                        : GestureDetector(
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              FocusManager.instance.primaryFocus?.unfocus();
                              try {
                                final data = await otpValidation.validateOTP(
                                    transactionId: widget.transactionId,
                                    context: context,
                                    otpNumber: otpNumber.text);

                                if (data == "Ok") {
                                  if (mounted) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                widget.nextScreen));
                                  }
                                }
                              } catch (e) {
                                print("Error during OTP validation: $e");
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Error: ${e.toString()}"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              } finally {
                                if (mounted) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                            child: Container(
                              height: 46.h,
                              width: 161.w,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF7B3884),
                                    Color(0xffC34BD4),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text("Confirm",
                                    style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s16)),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0, right: 0, child: Image.asset(widget.bgImage))
            ],
          ),
        ),
      ),
    );
  }

  void _resendCode() async {
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    setState(() {
      _isLoadingResend = true;
    });
    await otpGenerateNotifier.generateOTP(
        context: context, transactionId: widget.transactionId);
    otpNumber.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isLoadingResend = false;
      secondsRemaining = 60;
      enableResend = false;
    });
  }
}
