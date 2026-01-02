import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/remittance/currency_list_api.dart';
import 'package:unitey_app/models/currency_model/currency_list_model.dart';

class CurrencyListNotifier extends ChangeNotifier {
  final CurrencyListAPI _currencyListAPI=CurrencyListAPI();
  CurrencyListModel? _currencyListModel;
  bool isLoading = true;
  int _totalCurrencyLength = 0;

  int get getTotalLength => _totalCurrencyLength;

  CurrencyListModel? get getCurrencyModel => _currencyListModel;

  Future<void> getCurrencyList({
    required BuildContext context,
  }) async {

    try {
      isLoading = true;
      final listData = await _currencyListAPI.getCurrencyList();
      _currencyListModel = CurrencyListModel.fromJson(listData);
      _totalCurrencyLength = _currencyListModel!.result!.length;
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
