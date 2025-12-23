
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class AddBillerAPI {
  Future addBiller({
    required String billerTypeId,
    required String billerCurrency,
    required String billerName,
    required String billerNickName,
    required String billerCity,
    required String billerCountryCode,
    required String billerAccountName,
    required String billerAccountNumber,
    required String productsId,
    required String customerId,
    required String serviceId,
    String? billerDOB,
    String? billerState,
    String? billerPostCode,
  }) async {
    const String subUrl = "/billers";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "biller_type_id": billerTypeId,
      "service_id": serviceId,
      "biller_currency": billerCurrency,//required
      "biller_name": billerNickName,//required
      "biller_nick_name": billerNickName,
      "biller_city": billerCity,
      "biller_country_code": billerCountryCode,//required (+91)
      "biller_account_name": billerAccountName,
      "biller_account_number": billerAccountNumber,
      "biller_dob": billerDOB,//"2022-01-19T05:36:29.975Z",
      "biller_state": billerState,
      "biller_post_code": billerPostCode,
      "products_id":productsId,  //etisalat id


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
