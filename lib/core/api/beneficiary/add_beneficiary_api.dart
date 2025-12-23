
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';
import 'package:unitey_app/constant/global_manager.dart';

class AddBeneficiaryAPI {
  Future addBeneficiary({
    required String nickName,
    required String fullName,
    required String countryCode,
    required beneficiaryTypeId,
    required customerId,
    String? bankName,
     String? accountNumber,
    String? accountType,
    String? depositMethod,
    String? bankCode,
    String? address,
    String? city,
    String? state,
    String? currencyType,
    String? postcode,
    String? dob,
    String? walletId,
    String? walletType,
    String? email,
    String? contact,
    String? identityType,
    String? identityIssueCountry,
    String? identityId,
    String? identityAdditionalDetails,
    String? identityIssue,
    String? identityExpiry,
    String? cardNumber,
    String? relationship,
    String? localLanguage,
    String? logo,

  }) async {
    const String subUrl = "/beneficiaries";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "entity_id": GlobalData.entityId,
      "entity_key": GlobalData.entityKey,
      "customer_id":customerId,
      "beneficiary_type_id":null,// "61d487b25447240d56627372",
      "beneficiary_nick_name": nickName,
      "account_bank_name": bankName,
      "account_bank_code": bankCode,
      "bank_account_type": null,//Savings,Master,
      "beneficiary_account": accountNumber,
      "beneficiary_currency": currencyType, //INR
      "deposit_method": depositMethod, //Cash/Card/Wallet
      "beneficiary_name": fullName,
      "beneficiary_address": address,
      "beneficiary_city": city,
      "beneficiary_country_code": countryCode, //IN
      "beneficiary_state": state,
      "beneficiary_post_code": postcode,
      "beneficiary_dob": dob, //2022-01-18T11:37:00.967Z
      "beneficiary_email": email,
      "beneficiary_contact_number": contact, //"9539168059",
      "beneficiary_wallet_id": walletId,
      "beneficiary_wallet_type": walletType,
      "beneficiary_iden_type": 'PASSPORT',//passport
      "beneficiary_iden_issue_ctry": identityIssueCountry,
      "beneficiary_iden_id": identityId,
      "beneficiary_iden_data": identityAdditionalDetails,
      "beneficiary_iden_exp": identityExpiry,//"2022-01-18T11:37:00.967Z",
      "beneficiary_iden_issue":identityIssue,// "2022-01-18T11:37:00.967Z",
      "beneficiary_enc_card_num": cardNumber,
      "beneficiary_relationship": relationship,
      "beneficiary_name_lcl": localLanguage, //Malayalam
      "logo": logo, //Malayalam
    });
    print(bodyData);
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
