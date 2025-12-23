
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class GieomUploadFrontAPI {
  Future uploadFrontImage({
    required String userToken,
    required String base64Image,
  }) async {
    const String subUrl = "/upload/";

    const String uri = AppAPI.gieomUrl + subUrl;
    var formData = FormData.fromMap({
      'doctype': 'UaeGccFront',
      'userid': userToken,
      'image': base64Image
    });


    final response = await Api().dio.post(
      uri,
      data: formData,
      // options: Options(
      //   // headers: {"Content-Type": "application/x-www-form-urlencoded"},
      //     contentType: Headers.formUrlEncodedContentType,
      // )

      // options: Options(
      //   headers: {"Accept": 'application/x-www-form-urlencoded', "content-type": "application/x-www-form-urlencoded"},
      //   // contentType: 'application/x-www-form-urlencoded',
      // ),
    );


    final statusCode = response.statusCode;

    final body = response.data;

    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
