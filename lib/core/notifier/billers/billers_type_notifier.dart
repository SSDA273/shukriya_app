import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/billers/billers_type_api.dart';
import 'package:unitey_app/models/billers_type_model/billers_type_model.dart';

class BillersTypeNotifier extends ChangeNotifier {
final BillersTypeAPI _billersTypeAPI = BillersTypeAPI();
BillersTypeModel? _billersType;

   int _totalTypeLength = 0;

  int get getTotalLength => _totalTypeLength;

BillersTypeModel? get getBillersTypeModel => _billersType;

  Future<void> getBillersType({
    required BuildContext context,
  }) async {
    try {
      final otpData = await _billersTypeAPI.getBillersType();
      _billersType = BillersTypeModel.fromJson(otpData);
      _totalTypeLength = _billersType!.result!.length;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
