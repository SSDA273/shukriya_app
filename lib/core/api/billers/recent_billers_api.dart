
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class RecentBillersAPI {
  Future recentBillers({
    required String serviceSubcategoryId,
  }) async {
    const String subUrl = "/customer/recent/phone-recharges";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "service_sub_category_id":  serviceSubcategoryId,
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
