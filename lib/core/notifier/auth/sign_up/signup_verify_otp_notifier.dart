import 'package:flutter/material.dart';
import 'package:unitey_app/models/otp_response_model/otp_response_model.dart';
import 'package:unitey_app/widgets/error_alert.dart';

import '../../../api/auth/sign_up/signup_verify_otp_api.dart';

class SignUpOTPValidationNotifier extends ChangeNotifier {
  final SignUpOTPValidationAPI _otpValidationAPI = SignUpOTPValidationAPI();


  Future<String?> validateOTP({
    required BuildContext context,
    required String otpNumber,
    required dynamic customData
  }) async {
    try {
      final otpData = await _otpValidationAPI.validateOTP(
          otpNumber: otpNumber,
        customData: customData
      );
      final statusCode=otpData['statusCode'];
      notifyListeners();
      if (statusCode == 200) {
        return "Ok";
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const ErrorAlert(
                mainText: 'Invalid OTP',
                subText: 'Please enter valid OTP',
              );
            });
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }
}
