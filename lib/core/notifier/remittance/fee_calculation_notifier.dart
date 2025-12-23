import 'package:flutter/material.dart';

import '../../api/remittance/fee_calculation_api.dart';


class FeeCalculationNotifier extends ChangeNotifier {
  final FeeCalculationAPI _feeCalculationAPI = FeeCalculationAPI();

  String _totalFee="0.00";
  String _vatAmount="0.00";
  String _agentFee="0.00";
  bool _isLoading = false;
  // int _totalShiftLength = 0;
  bool get getIsLoading => _isLoading;

  String get getTotalFee => _totalFee;
  String get getVATAmount => _vatAmount;
  String get getAgentFee => _agentFee;

  Future<void> getRemittanceFee({
    required BuildContext context,
    required  String feeFxId,
    required num amount,
    required String commissionType,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final detailsData = await _feeCalculationAPI.getTotalRemittanceFee(feeFxId: feeFxId, amount: amount,commissionType:commissionType);
      final statusCode = detailsData['statusCode'];
      if(statusCode == 200){
        if(commissionType == "customer"){
          _totalFee = detailsData['result']['total_fees'];
          _vatAmount = detailsData['result']['vat_amount'];
          _isLoading = false;
          notifyListeners();
        }else{
          _agentFee = detailsData['result']['total_fees'];
          _isLoading = false;
          notifyListeners();
        }

      }
      _isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
