

import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class GieomLivenessAPI {

  Future checkLiveness({required String userId,required bool isIos,required XFile video}) async {
    const String subUrl = "/liveness_check";
    const String uri = AppAPI.gieomUrl+subUrl;

    var formData = FormData.fromMap({
      'userid': userId,
      'isios': isIos,
      'livevideo': await MultipartFile.fromFile(video.path)
    });
    final response = await Api().dio.post(
      uri,
      data: formData,
      queryParameters: {
        "userid":userId
      },
      options: Options(
        // headers: {"accept": "*/*'", "content-type": "application/json"},
        contentType: 'multipart/form-data',
      ),
    );

    final statusCode = response.statusCode;

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
