
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class PayBillAPI {
  Future payBill({
    required double billAmount,
    required String billNotes,
    required String debitAmountCurrency,
    required String serviceId,
     String? billerId,
    required String customerId,
    required List<Map<String, dynamic>>? feeStructure,
  }) async {
    const String subUrl = "/billers/pay";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "service_id": serviceId,
      "customer_id":customerId,
      "statement_narrative": billNotes,
      "debit_amount":billAmount,
      "debit_amount_currency": debitAmountCurrency,
      "biller_id":billerId,
      "account_id": "61e3b9fbdf3ceff3769ebf89",
      "channel": "mobile",
      "fee_structure":feeStructure
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
