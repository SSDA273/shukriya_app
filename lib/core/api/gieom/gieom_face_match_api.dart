
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class GieomFaceMatchAPI {
  Future checkFaceMatch({required String userId,required String image}) async {
    const String subUrl = "/face_match";
    const String uri = AppAPI.gieomUrl + subUrl;
    var formData = FormData.fromMap({
      'userid': userId,
      'scrutinydoctype': 'UaeGccFront',
      'selfie': image
    });
    final response = await Api().dio.post(
      uri,
      data: formData,
      queryParameters: {
        "userid":userId
      },
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
