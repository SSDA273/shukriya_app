import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/auth/auth_verify_otp_api.dart';
import 'package:unitey_app/widgets/error_alert.dart';

class AuthVerifyOTPNotifier extends ChangeNotifier {
  final AuthVerifyOTPAPI _authVerifyOTPAPI =AuthVerifyOTPAPI();

  Future<String?> validateOTP({
    required BuildContext context,
    required String otpNumber,
  }) async {
    try {
      final otpData = await _authVerifyOTPAPI.validateOTP(otpNumber: otpNumber);
      final statusCode=otpData['statusCode'];
      notifyListeners();
      if (statusCode == 200) {
        print("Successfully Validated");
        return "Ok";
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const ErrorAlert(
                mainText: 'Invalid OTP',
                subText: 'Please enter valid OTP',
              );
            },
        );
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
