import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/customer_api/change_password/reset_verify_api.dart';
import 'package:unitey_app/widgets/error_alert.dart';

class ResetVerifyNotifier extends ChangeNotifier {
  final ResetVerifyAPI _resetVerifyAPI = ResetVerifyAPI();

  Future<String?> validateOTP({
    required BuildContext context,
    required String currentPassword,
    required String newPassword,
    required String otp,
  }) async {
    try {
      final otpData = await _resetVerifyAPI.setNewPassword(currentPassword: currentPassword, newPassword: newPassword, otp: otp);
      final statusCode=otpData['statusCode'];
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
            });
      }
    } catch (error) {
      rethrow;
    }
  }
}
