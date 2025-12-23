
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/constant/global_manager.dart';
import 'package:unitey_app/core/interceptor/app_dio.dart';

import '../../../main.dart';

class ExchangeHouseListAPI {
  Future getExchangeHouseList({required String fromCurrency,required String toCurrency}) async {
      String subUrl = "/customer/exchange-houses";
      String uri = AppAPI.baseUrl + subUrl;
      
      // Map currency to country code
      String toCountry = '';
      switch (toCurrency) {
        case 'INR':
          toCountry = 'IN';
          break;
        case 'PKR':
          toCountry = 'PK';
          break;
        case 'PHP':
          toCountry = 'PH';
          break;
        case 'BDT':
          toCountry = 'BD';
          break;
        default:
          toCountry = 'IN'; // Default fallback
      }
      
      final bodyData = json.encode({
        "entity_id": GlobalData.entityId,
        "entity_key": GlobalData.entityKey,
        "to_country": toCountry,
        "modeOfTransfer": "BANK", // Changed from MOBILE to BANK as per backend team requirement
        "from_currency": fromCurrency,
        "to_currency": toCurrency,
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
