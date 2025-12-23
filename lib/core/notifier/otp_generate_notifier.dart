
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/otp_generate_api.dart';

class OTPGenerateNotifier extends ChangeNotifier {
  final OTPGenerateAPI _otpGenerateAPI = OTPGenerateAPI();

  Future<void> generateOTP({
    required BuildContext context,
    required String transactionId,
  }) async {
    try {
      print("transactionId $transactionId");
      // final scopeNotifier = Provider.of<ScopeNotifier>(context, listen: false);
      final otpData =
          await _otpGenerateAPI.generateOTP(transactionId: transactionId);
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
