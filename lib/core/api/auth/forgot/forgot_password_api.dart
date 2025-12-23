import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

import '../../../../constant/global_manager.dart';

class ForgotPasswordAPI {
  Future setNewPassword(
      {required String password,
      required String token,
      }) async {
    const String subUrl = "/auth/customer/forgot-password/otp/change_password";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "password": password,
      "token": token,
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
