import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/bill/popular_bills_api.dart';
import 'package:unitey_app/models/popular_bills_model/popular_bills_model.dart';

class PopularBillsNotifier extends ChangeNotifier {
  final PopularBillsAPI _popularBillsAPI = PopularBillsAPI();
  PopularBillsModel? _popularBillsModel;
  bool isLoading = false;
  int _totalBillLength = 0;

  int get getTotalLength => _totalBillLength;

  PopularBillsModel? get getPopularBillsModel => _popularBillsModel;

  Future<void> getPopularBills({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final listData = await _popularBillsAPI.getPopularBills();
      _popularBillsModel = PopularBillsModel.fromJson(listData);
      _totalBillLength = _popularBillsModel!.result!.length;
      print("length $_totalBillLength");
      isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
    }
  }
}
