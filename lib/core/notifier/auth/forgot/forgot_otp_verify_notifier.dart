import 'package:flutter/material.dart';
import '../../../api/auth/forgot/forgot_otp_verify_api.dart';

class ForgotOTPVerifyNotifier extends ChangeNotifier {
  final ForgotOTPVerifyAPI _otpVerifyAPI = ForgotOTPVerifyAPI();
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;

  Future<String?> verifyOTP({
    required BuildContext context,
    required String userName,
    required String otp,
  }) async {
    try {
      _isLoading=true;
      notifyListeners();
      final otpData = await _otpVerifyAPI.verifyOTP(userName: userName, otp: otp);
      final message = otpData['message'];
      final statusCode = otpData['statusCode'];
      final token = otpData['result']['token'];
      if (statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        return token;
      } else {
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    } catch (error) {
      _isLoading=false;
      notifyListeners();
      rethrow;
    }
    return null;
  }
}
