
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class BillServiceFeeAPI {
  Future getServiceBillFee({required String serviceId,required num amount}) async {
    const String subUrl = "/customer/service-fee";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "service_id": serviceId,
      "amount": amount
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
