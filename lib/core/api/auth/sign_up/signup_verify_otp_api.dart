import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/global_manager.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class SignUpOTPValidationAPI {
  Future validateOTP({
    required String otpNumber,
    required dynamic customData
  }) async {
    const String subUrl = "/auth/customer/onBoarding/verify-otp";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "otp": otpNumber,
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "customer_data":customData
    });
    final response = await Api().dio.post(
      uri,
      data: bodyData,
      options: Options(
        // headers: {"accept": "*/*'", "content-type": "application/json"},
        contentType: 'application/json',
      ),
    );

    final statusCode = response.statusCode;

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
