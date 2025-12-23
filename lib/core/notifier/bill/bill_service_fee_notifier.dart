import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/bill/bill_service_fee_api.dart';
import 'package:unitey_app/models/bill_service_fee_model/bill_service_fee_model.dart';

class BillServiceFeeNotifier extends ChangeNotifier {
  final BillServiceFeeAPI _billServiceFeeAPI=BillServiceFeeAPI();
  BillServiceFeeModel? _billServiceFeeModel;
  bool _isLoading = false;
  BillServiceFeeModel? get getBillServiceFee => _billServiceFeeModel;
 bool get getIsLoading => _isLoading;

  Future<void> getBillFee({
    required BuildContext context,
    required String serviceId,
    required num amount
  }) async {
    try {
      _isLoading = true;
      final listData = await _billServiceFeeAPI.getServiceBillFee(serviceId: serviceId, amount: amount);
      _billServiceFeeModel = BillServiceFeeModel.fromJson(listData);
      _isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
    }
  }
}
