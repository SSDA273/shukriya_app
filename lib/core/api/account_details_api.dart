import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class AccountDetailsAPI {
  Future getAccountDetails({
    required String customerId,
  }) async {
    const String subUrl = "/accounts/details/customer-id";
    const String uri = AppAPI.baseUrl + subUrl;
    print("🏦 Account Details API call to: $uri");
    print("🏦 Request Body: entity_id=${GlobalData.entityId}, entity_key=${GlobalData.entityKey}, customer_id=$customerId");
    final response = await Api().dio.post(
      uri,
      data: {
        "entity_id": GlobalData.entityId,
        "entity_key": GlobalData.entityKey,
        "customer_id": customerId
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
