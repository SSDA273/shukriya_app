import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/global_manager.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class ResetVerifyAPI {
  Future setNewPassword({
    required String currentPassword,
    required String newPassword,
    required String otp,
  }) async {
    const String subUrl = "/customer/reset-password/verify";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "current_password": currentPassword,
      "new_password": newPassword,
      "otp": otp
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
