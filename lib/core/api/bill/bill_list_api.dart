
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class BillListAPI {
  Future getBillList() async {
    const String subUrl = "/customer/bill-categories";
    const String uri = AppAPI.baseUrl + subUrl;
    final response = await Api().dio.get(
      uri,
      queryParameters: {
        'isInternational': false,
        'entity_id': GlobalData.entityId // Use correct entity_id from GlobalData
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
