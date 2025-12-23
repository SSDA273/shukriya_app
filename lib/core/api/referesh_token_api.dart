import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class AuthenticationApi {
  Future login({
    required String username,
    required String password,
  }) async {
    const String subUrl = "/auth/login/customer";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({"username": username, "password": password});
    final response = await Api().dio.post(
      uri,
      data: bodyData,
      options: Options(
        // headers: {"accept": "*/*'", "content-type": "application/json"},
        contentType: 'application/json',
      ),
    );

    final statusCode = response.statusCode;
    print("auth status code $statusCode");

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
