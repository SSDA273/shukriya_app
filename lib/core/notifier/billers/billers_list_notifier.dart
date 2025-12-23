import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/billers/billers_list_api.dart';
import 'package:unitey_app/models/billers_list_model/billers_list_model.dart';

class BillerListNotifier extends ChangeNotifier {
  final BillersListAPI _billersListAPI =BillersListAPI();
 BillersListModel? _billersListModel;
  int _totalBillersLength = 0;

  int get getTotalLength => _totalBillersLength;
  BillersListModel? get getBillersList => _billersListModel;
  bool isLoading = true;

  Future<void> getBillerList({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final data = await _billersListAPI.getBillersList();
      _billersListModel = BillersListModel.fromJson(data);
      _totalBillersLength = _billersListModel!.result!.length;
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
