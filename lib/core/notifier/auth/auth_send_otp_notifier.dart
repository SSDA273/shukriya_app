import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/auth/auth_send_otp_api.dart';
import 'package:unitey_app/core/api/otp_generate_api.dart';

class AuthSendOTPNotifier extends ChangeNotifier {
  final AuthSendOTPAPI _authSendOTPAPI =AuthSendOTPAPI();

  Future<void> sendOTP({
    required BuildContext context,
    required String mobileNumber,
  }) async {
    try {
      print("mobileNo $mobileNumber");
      // final scopeNotifier = Provider.of<ScopeNotifier>(context, listen: false);
      final otpData =  await _authSendOTPAPI.sendOTP(mobileNumber: mobileNumber);
      final generatedOTP = otpData['result'];
      final message = otpData['message'];
      final statusCode = otpData['statusCode'];
      // final refreshToken = userData['refresh'];
      print("Sent OTP is $generatedOTP");
      if (statusCode == 200) {
        print("Successfully generated");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    }catch(error){
      rethrow;
    }}
}
