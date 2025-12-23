import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/otp_validation_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/otp_response_model/otp_response_model.dart';
import 'package:unitey_app/widgets/error_alert.dart';

class OTPValidationNotifier extends ChangeNotifier {
  final OTPValidationAPI _otpValidationAPI = OTPValidationAPI();
  late OTPResponseModel? _otpResponseModel;

  OTPResponseModel? get getOtpResponse => _otpResponseModel;

  Future<String?> validateOTP({
    required BuildContext context,
    required String otpNumber,
    required String transactionId,
  }) async {
    try {
      final otpData = await _otpValidationAPI.validateOTP(
          otpNumber: otpNumber, transactionId: transactionId);
      final statusCode=otpData['statusCode'];
      notifyListeners();
      if (statusCode == 200) {
        _otpResponseModel = OTPResponseModel.fromJson(otpData);
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
