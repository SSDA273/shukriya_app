import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/bill/bill_list_api.dart';
import 'package:unitey_app/models/bill_list_model/bill_list_model.dart';

class BillListNotifier extends ChangeNotifier {
  final BillListAPI _billListAPI=BillListAPI();
  BillListModel? _billListModel;
  bool isLoading = false;
  int _totalBillLength = 0;

  int get getTotalLength => _totalBillLength;

  BillListModel? get getBillerModel => _billListModel;

  Future<void> getBillList({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final listData = await _billListAPI.getBillList();
      _billListModel = BillListModel.fromJson(listData);
      _totalBillLength = _billListModel!.result!.length;
      print("length $_totalBillLength");
      isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
    }
  }
}
