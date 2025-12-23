import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

import '../../../../constant/global_manager.dart';

class ForgotOTPVerifyAPI {
  Future verifyOTP({
    required String userName,
    required String otp,
  }) async {
    const String subUrl = "/auth/customer/forgot-password/verify_otp";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "username": userName,
      "otp": otp,
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
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
