import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/customer_api/change_password/reset_password_api.dart';

class ResetPasswordNotifier extends ChangeNotifier {
  final ResetPasswordAPI resetPasswordAPI = ResetPasswordAPI();
  Future<void> sendOTPNewPassword({
    required BuildContext context,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final otpData =
      await resetPasswordAPI.sendOTPNewPassword(currentPassword: currentPassword, newPassword: newPassword);
      final message = otpData['message'];
      final statusCode = otpData['statusCode'];
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
