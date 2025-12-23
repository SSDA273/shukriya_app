import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/beneficiary/pay_remittance_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/pay_remittance_model/pay_remittance_model.dart';
import 'package:unitey_app/widgets/error_alert.dart';

import '../remittance/fee_calculation_notifier.dart';

class PayRemittanceNotifier extends ChangeNotifier {
  final PayRemittanceAPI _payRemittanceAPI = PayRemittanceAPI();
  final CacheService _cacheService = CacheService();
  PayRemittanceModel? _payRemittanceModel;

  PayRemittanceModel? get getPayResponse => _payRemittanceModel;

  Future<PayRemittanceModel?> payRemittance({
    required BuildContext context,
    required double amount,
    required String debitCurrency,
    required String beneficiaryId,
    required String narrative,
    required String purpose,
    required String source,
    required double exchangeRate,
    required String feeFxId,
    required String serviceId,
    required String creditAmountCurrency,
    required double creditAmount,
    required double totalFee,
    String? notes,
  }) async {
    final feeCalculation =
    Provider.of<FeeCalculationNotifier>(context, listen: false);
    try {
      final customerId = await _cacheService.readCache(key: "customerId");
      print("Customer Id is $customerId");
      final data = await _payRemittanceAPI.payRemittance(
        creditAmount: creditAmount,
        creditAmountCurrency: creditAmountCurrency,
        totalFee: totalFee,
        feeFxId: feeFxId,
        serviceId: serviceId,
        notes: notes,
        exchangeRate: exchangeRate,
        accountId: "61e3b9fbdf3ceff3769ebf89",
        beneficiaryId: beneficiaryId,
        amount: amount,
        vatAmount:double.parse(feeCalculation.getVATAmount),
        debitCurrency: debitCurrency,
        narrative: narrative,
        purpose: purpose,
        source: source,
      );
      final statusCode = data["statusCode"];
      final message = data["message"];

      if (statusCode == 200) {
        _payRemittanceModel = PayRemittanceModel.fromJson(data);
        return _payRemittanceModel;
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
