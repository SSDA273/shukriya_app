import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class UpdateProfileAPI {
  Future updateProfile({required String profileImage}) async {
    const String subUrl = "/customer/profile/edit";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "profileImage": profileImage
    });
    final response = await Api().dio.patch(
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
