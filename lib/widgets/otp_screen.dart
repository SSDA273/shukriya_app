import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/core/notifier/customer/customer_profile_notifier.dart';
import 'package:unitey_app/core/notifier/otp_generate_notifier.dart';
import 'package:unitey_app/core/notifier/otp_validation_notifier.dart';
import 'package:unitey_app/generated/l10n.dart';

import '../constant/color_manger.dart';
import '../constant/font_manager.dart';
import '../constant/style_manager.dart';
import 'circular_indicator_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    Key? key,
    required this.transactionId,
  }) : super(key: key);
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
    print("Transaction Id is ${widget.transactionId}");

    final otpValidation =
        Provider.of<OTPValidationNotifier>(context, listen: false);
    final customerDetails =
        Provider.of<CustomerProfileNotifier>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Verify OTP",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter received OTP",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              (customerDetails.getCustomerNumber ?? '')
                  .replaceAll(RegExp(r'.(?=.{2})'), 'X'),
              style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),
            ),
            const SizedBox(
              height: 25,
            ),
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
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "${S.of(context).didNotReceived} ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                _isLoadingResend
                    ? const CircularIndicatorWidget()
                    : TextButton(
                        onPressed: enableResend ? _resendCode : null,
                        child: Text(
                          S.of(context).resendOTP,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: enableResend
                                      ? Colors.black
                                      : Colors.grey),
                        ),
                      ),
                enableResend
                    ? const SizedBox()
                    : Text(
                        'in 0:$secondsRemaining',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.red,
                            ),
                      ),
              ],
            ),
            Center(
              child: _isLoading
                  ? const CircularIndicatorWidget()
                  : GestureDetector(
                onTap: ()async{
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
                    Navigator.pop(context, "success");
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                child:Container(
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
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: Text("Confirm",
                        style: getSemiBoldStyle(
                            color: ColorManager.white, fontSize: FontSize.s16)),
                  ),
                ),
              )
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? const SizedBox(
                    height: 103,
                  )
                : const SizedBox(
                    height: 30,
                  ),
          ],
        ),
      ),
    );
  }

  void _resendCode() async {
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    setState((){
      _isLoadingResend=true;
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
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      // height: 71,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          controller: controller,
          autofocus: autoFocus,
          decoration: const InputDecoration(
            border: InputBorder.none,

          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline3,
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
      ),
    );
  }
}
