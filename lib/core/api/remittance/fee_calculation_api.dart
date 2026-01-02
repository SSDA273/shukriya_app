import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../constant/api_const/app_api.dart';
import '../../../constant/global_manager.dart';
import '../../interceptor/app_dio.dart';

class FeeCalculationAPI {
  Future getTotalRemittanceFee({
    required String feeFxId,
    required num amount,
    required String commissionType,
    required String fromCurrency,
    required String toCurrency,
    required String serviceId,
    required String toCountry
  }) async {
    const String subUrl = "/remittance/fees-calculation";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "amount": amount,
      "fee_fx_id": feeFxId,
      "type": commissionType,
      "from_currency": fromCurrency,
      "to_currency": toCurrency,
      "serviceid": serviceId,
      "to_country": toCountry
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
