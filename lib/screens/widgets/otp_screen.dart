import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/extension/string_extension.dart';
import '../../core/notifier/customer/customer_profile_notifier.dart';
import '../../core/notifier/otp_generate_notifier.dart';
import '../../core/notifier/otp_validation_notifier.dart';
import '../../generated/l10n.dart';
import '../../widgets/circular_indicator_widget.dart';
import '../home/pay_beneficiary/beneficiary_success_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.transactionId}) : super(key: key);
  final String transactionId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final TextEditingController one;
  late final TextEditingController two;

  late final TextEditingController three;
  late final TextEditingController four;
  late final TextEditingController five;
  late final TextEditingController six;
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
    one = TextEditingController();
    two = TextEditingController();
    three = TextEditingController();
    four = TextEditingController();
    five = TextEditingController();
    six = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    one.dispose();
    two.dispose();
    three.dispose();
    four.dispose();
    five.dispose();
    six.dispose();
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
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        // spacing: 30,
                        direction: Axis.horizontal,
                        // runSpacing: 10,
                        children: [
                          _otpTextField(context, true, one),
                          _otpTextField(context, false, two),
                          _otpTextField(context, false, three),
                          _otpTextField(context, false, four),
                          _otpTextField(context, false, five),
                          _otpTextField(context, false, six),
                        ],
                      ),
                    ),
                    kSizedBox40,
                    Text(
                      (customerDetails.getCustomerNumber ?? '').maskNumber((customerDetails.getCustomerNumber ?? '').length),
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
                        final otpNumber =
                            "${one.text}${two.text}${three.text}${four.text}${five.text}${six.text}";
                        FocusManager.instance.primaryFocus!.unfocus();
                        final data = await otpValidation.validateOTP(
                            transactionId: widget.transactionId,
                            context: context,
                            otpNumber: otpNumber);

                        if (data == "Ok") {
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BeneficiarySuccessScreen()));
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

  void _resendCode() async {
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    setState(() {
      _isLoadingResend = true;
    });
    await otpGenerateNotifier.generateOTP(
        context: context, transactionId: widget.transactionId);
    one.clear();
    two.clear();
    three.clear();
    four.clear();
    five.clear();
    six.clear();
    FocusManager.instance.primaryFocus!.unfocus();
    setState(() {
      _isLoadingResend = false;
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  Widget _otpTextField(
      BuildContext context, bool autoFocus, TextEditingController controller) {
    return Container(
      height: 54.h,
      width: 47.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.primary,width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF5F6FA),
        shape: BoxShape.rectangle,
      ),
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        cursorColor: ColorManager.primary,
        decoration:  InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 10.0.h),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline4!.copyWith(color: ColorManager.primary),
        maxLines: 1,
        onChanged: (value) {
          if (value.length == 1 && six.text.isEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && one.text.isNotEmpty) {
            FocusScope.of(context).previousFocus();
          }
          // else {
          //   setState(() {
          //     enteredNumberList.add(value);
          //     String newValue = enteredNumberList.join("");
          //     enteredNumber = newValue;
          //   });
          // }
        },
      ),
    );
  }
}
