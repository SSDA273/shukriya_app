import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/billers/pay_bill_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/pay_bill_model/pay_response_model.dart';
import 'package:unitey_app/widgets/error_alert.dart';

class PayBillNotifier extends ChangeNotifier {
  final PayBillAPI _payBillAPI = PayBillAPI();
  final CacheService _cacheService = CacheService();
  PayResponseModel? _payResponseModel;

  PayResponseModel? get getPayResponse => _payResponseModel;
  bool isLoading = false;

  Future<PayResponseModel?> payBill({
    required BuildContext context,
    required double billAmount,
    required String debitAmountCurrency,
    String? billNotes,
    required String serviceId,
    String? billerId,
    required List<Map<String, dynamic>>? feeStructure,
  }) async {
    try {
      final customerId = await _cacheService.readCache(key: "customerId");
      print("Customer Id is $customerId");
      final data = await _payBillAPI.payBill(
        feeStructure: feeStructure,
          serviceId: serviceId,
          billerId: billerId,
          billAmount: billAmount,
          billNotes: billNotes ?? "",
          debitAmountCurrency: debitAmountCurrency,
          customerId: customerId);
      final status = data["statusCode"];
      final message = data["message"];

      if (status == 200) {
        _payResponseModel = PayResponseModel.fromJson(data);
        return _payResponseModel;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorAlert(
                mainText: 'Please contact Admin',
                subText: message,
              );
            });
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
