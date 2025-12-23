
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class UploadImageAPI {
  Future uploadImage({required File image,required String type}) async {
    print("uploading image type is == $image");
    String subUrl = "/files/upload";
    String uri = AppAPI.baseUrl + subUrl;
    var formData = FormData.fromMap({
      "file":await MultipartFile.fromFile(image.path),
      "type":type //"customers" //beneficiaries //Emirates
    });
    final response = await Api().dio.post(
      uri,
      data: formData,
      // options: Options(
      //   // headers: {"accept": "*/*'", "content-type": "application/json"},
      //   contentType: 'application/json',
      // ),
    );

    final statusCode = response.statusCode;

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}
