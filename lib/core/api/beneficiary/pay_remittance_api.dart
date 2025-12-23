
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class PayRemittanceAPI {
  Future payRemittance({
    required double amount,
    required String debitCurrency,
    required String narrative,
    required String beneficiaryId,
    required String accountId,
    required String purpose,
    required String source,
    required double exchangeRate,
    required String creditAmountCurrency,
    required double creditAmount,
    required double totalFee,
    required double vatAmount,
    required String feeFxId,
    required String serviceId,
    String? notes,
  }) async {
    const String subUrl = "/remittance";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id":GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "service_id": serviceId,
      "statement_narrative": narrative,
      "remittance_note": notes,
      "debit_amount": amount,
      "exchange_rate": exchangeRate,
      "debit_amount_currency": debitCurrency,
      "credit_amount_currency": creditAmountCurrency,
      "credit_amount": creditAmount,
      "total_fee": totalFee,
      "beneficiary_id":beneficiaryId,
      "account_id": accountId,
      "purpose_code": purpose,
      "remittance_source": source,
      "channel": "mobile",
      "fee_fx_id":feeFxId,
      "vat_amount":vatAmount
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
