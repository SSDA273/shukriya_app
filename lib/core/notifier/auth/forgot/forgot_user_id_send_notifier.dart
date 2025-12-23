import 'package:flutter/material.dart';
import 'package:unitey_app/constant/color_manger.dart';

import '../../../api/auth/forgot/forgot_user_id_api.dart';

class ForgotUserIDSendNotifier extends ChangeNotifier {
  final ForgotUserIDSendAPI _userIDSendAPI = ForgotUserIDSendAPI();
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  Future<String?> userIDSendOTP({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final otpData = await _userIDSendAPI.getMobileNumber(userId: userId);
      final message = otpData['message'];
      final statusCode = otpData['statusCode'];
      if (statusCode == 200) {
        _isLoading = false;
        notifyListeners();
        final mobileNumber = otpData['result']['mobileNumber'];
        return mobileNumber;
      } else {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message),
        backgroundColor: ColorManager.red,));
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
    return null;
  }
}
