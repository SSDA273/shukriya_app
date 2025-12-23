import 'package:flutter/material.dart';
import '../../../api/auth/forgot/forgot_password_api.dart';

class ForgotPasswordNotifier extends ChangeNotifier {
  final ForgotPasswordAPI _passwordAPI = ForgotPasswordAPI();
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;

  Future<String?> changeUserPassword({
    required BuildContext context,
    required String password,
    required String token,
  }) async {
    try {
      _isLoading=true;
      notifyListeners();
      final otpData = await _passwordAPI.setNewPassword(
       password: password,
        token: token
      );
      final message = otpData['message'];
      final statusCode = otpData['statusCode'];
      if (statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Password Changed"),
          backgroundColor: Colors.green,
        ));
        return "ok";
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
