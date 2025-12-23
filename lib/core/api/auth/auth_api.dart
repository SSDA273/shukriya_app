import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/global_manager.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class AuthenticationApi {
  Future login({
    required String username,
    required String password,
  }) async {
    const String subUrl = "/auth/login/customer";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "username": username,
      "password": password,
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey
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
    print("auth status code $statusCode");

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }

  Future signUp({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    const String subUrl = "/auth/customer/sign_up";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode(
      {
        "firstName": firstName,
        "lastName": lastName,
        "middleName": "",
        "address": {
          "location": "",
          "city": "",
          "state": "",
          "pincode": "",
          "addressLine": "",
          "addressLine2": "",
          "PO_box": ""
        },
        "entities": [
          {
            "id": GlobalData.entityId
          }
        ],
        "email": "",
        "mobileNumber": "",
        "emiratesId": "",
        "username": username,
        "password": password,
        "employeeName": "",
        "emirate": "",
        "profileImage": ""
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
    print("signup status code $statusCode");

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
