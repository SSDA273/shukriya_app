import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/auth/sign_up/emirates_id_notifier.dart';
import 'package:unitey_app/extension/string_extension.dart';
import '../../../core/notifier/auth/sign_up/signup_verify_otp_notifier.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/circular_indicator_widget.dart';

class SignUpOTPScreen extends StatefulWidget {
  const SignUpOTPScreen({Key? key,required this.userName,required this.password,required this.emiratesId,required this.profileImage}) : super(key: key);
  final String userName,emiratesId,password,profileImage;
  @override
  State<SignUpOTPScreen> createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {
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
    final signUpOtpValidation =
    Provider.of<SignUpOTPValidationNotifier>(context, listen: false);
final emiratesIdNotifier = Provider.of<EmiratesIdNotifier>(context,listen: false).getSignUpModel;
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
          height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-AppBar().preferredSize.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                //  bottom: 10,
                // right: 0,
                top: 400.h,
                left: 271.w,
                child: SvgPicture.asset(
                  ImageAssets.homeBgFrame,
                  height: 198.w,
                  // width: 105,
                  // height: 147,
                  // color: Color.fromRGBO(38, 38, 38, 0.4),
                  // color:const Color(0xffFD5BAA),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageAssets.otpIc,
                      height: 112.h,),
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
                              color: ColorManager.grey3, fontSize: FontSize.s14),
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
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                          selectedFillColor:ColorManager.filledColor,
                          inactiveFillColor: ColorManager.filledColor,
                          activeFillColor:ColorManager.filledColor,
                        ),
                        enableActiveFill: true,
                        onChanged: (value){}),
                    kSizedBox40,
                    Text(
                      emiratesIdNotifier!.result!.mobileNumber.maskNumber( emiratesIdNotifier.result!.mobileNumber.length),
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
                              color: ColorManager.grey3, fontSize: FontSize.s14),
                        ),

                        _isLoadingResend
                            ? const Padding(
                          padding:  EdgeInsets.only(left: 5.0),
                          child:  CircularIndicatorWidget(),
                        )
                            : TextButton(
                          onPressed: enableResend ? _resendCode : null,
                          child: Text(
                            S.of(context).resendOTP,
                            style: getBoldStyle(
                                color: ColorManager.tertiary,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ],
                    ),
                    kSizedBox50,
                    _isLoading?const CircularIndicatorWidget():
                    GestureDetector(
                      onTap: () async{
                        setState(() {
                          _isLoading = true;
                        });

                        FocusManager.instance.primaryFocus!.unfocus();
                        debugPrint("////////////${emiratesIdNotifier.result!.customData}");
                        final data = await signUpOtpValidation.validateOTP(
                            context: context,
                            otpNumber: otpNumber.text,
                          customData: emiratesIdNotifier.result!.customData
                        );

                        if (data == "Ok") {
                          setState(() {
                            _isLoading = false;
                          });
                          //Show bottom success screen and then redirect to login screen
                          showSuccessSheet();
                          Future.delayed(const Duration(seconds: 3)).then((value) =>Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false));
                        }
                        setState(() {
                          _isLoading = false;
                        });

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
                                  color: ColorManager.white, fontSize: FontSize.s16)),
                        ),
                      ),
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
  Future showSuccessSheet(){
    return showModalBottomSheet(context: context, builder: (context){
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Congratulations",
                  style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s26),),
                Text("your account has been successfully created",
                  style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s16),),
              ],
            ),
          ),
          Positioned(
              top:-60.h,
              child: CircleAvatar(
                  backgroundColor: ColorManager.white,
                  radius:60.r,
                  child:  Lottie.asset(ImageAssets.congratulation,fit: BoxFit.cover)))
        ],
      );
    });
  }

  void _resendCode() async {
    setState(() {
      _isLoadingResend = true;
    });
    await Provider.of<EmiratesIdNotifier>(context,listen: false).emiratesId(
        context: context,
        profileImage: widget.profileImage,
        emiratesId:  widget.emiratesId,
      userName: widget.userName,
      password: widget.password
    );
    otpNumber.clear();
    FocusManager.instance.primaryFocus!.unfocus();
    setState(() {
      _isLoadingResend = false;
      secondsRemaining = 60;
      enableResend = false;
    });
  }


}
