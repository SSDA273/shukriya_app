
import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class CustomerProfileAPI {
  Future getCustomerProfile() async {
    const String subUrl = "/customer/profile";
    const String uri = AppAPI.baseUrl + subUrl;
    final response = await Api().dio.get(
      uri,
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
