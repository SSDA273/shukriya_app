
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

class EditBeneficiaryAPI {
  Future editBeneficiary({required String id}) async {
    String subUrl = "/beneficiaries/$id";
    String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": "61d487b25447240d56627372",
      "entity_key": "string",
      "customer_id": "61d487b25447240d56627372",
      "beneficiary_type_id": "61d487b25447240d56627372",
      "beneficiary_nick_name": "string",
      "account_bank_name": "string",
      "account_bank_code": "string",
      "bank_account_type": "string",
      "beneficiary_account": "string",
      "beneficiary_currency": "string",
      "deposit_method": "string",
      "beneficiary_name": "string",
      "beneficiary_address": "string",
      "beneficiary_city": "string",
      "beneficiary_country_code": "string",
      "beneficiary_state": "string",
      "beneficiary_post_code": "string",
      "beneficiary_dob": "2022-02-02T11:40:29.736Z",
      "beneficiary_email": "string",
      "beneficiary_contact_number": "9539168059",
      "beneficiary_wallet_id": "string",
      "beneficiary_wallet_type": "string",
      "beneficiary_iden_type": "string",
      "beneficiary_iden_issue_ctry": "string",
      "beneficiary_iden_id": "string",
      "beneficiary_iden_data": "string",
      "beneficiary_iden_exp": "2022-02-02T11:40:29.736Z",
      "beneficiary_iden_issue": "2022-02-02T11:40:29.736Z",
      "beneficiary_enc_card_num": "string",
      "beneficiary_relationship": "string",
      "beneficiary_name_lcl": "string",
      "isDefault": true,
      "isActive": true,
      "isDeleted": false,
      "createdBy": true
    });
    final response = await Api().dio.patch(
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
