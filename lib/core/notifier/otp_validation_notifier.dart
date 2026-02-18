import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/otp_validation_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/otp_response_model/otp_response_model.dart';
import 'package:unitey_app/models/otp_response_model/otp_result_model.dart';
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
    // Check for hardcoded demo OTP first to bypass API calls if needed
    if (otpNumber == "123456") {
      final random = Random();
      final randomDigits = String.fromCharCodes(Iterable.generate(
          10, (_) => '0123456789'.codeUnitAt(random.nextInt(10))));
      final randomId = "TXN$randomDigits";
          
      _otpResponseModel = OTPResponseModel(
        statusCode: 200,
        message: "Successfully Validated",
        result: OTPResultModel(
          referenceNumber: randomId,
          statusDescription: "Success",
          updatedAt: DateTime.now(),
        ),
      );
      notifyListeners();
      print("Successfully Validated with Demo OTP");
      return "Ok";
    }

    try {
      final otpData = await _otpValidationAPI.validateOTP(
          otpNumber: otpNumber, transactionId: transactionId);
      final statusCode = otpData['statusCode'];
      notifyListeners();
      
      if (statusCode == 200) {
        _otpResponseModel = OTPResponseModel.fromJson(otpData);
        print("Successfully Validated with API");
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
      print("OTP Validation Error: $error");
      rethrow;
    }
  }
}
