import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/remittance/exchange_house_list_api.dart';
import 'package:unitey_app/models/exchange_house_model/exchange_house_model.dart';
import 'package:unitey_app/models/exchange_house_model/exchange_product_model.dart';

class ExchangeHouseListNotifier extends ChangeNotifier {
  final ExchangeHouseListAPI _exchangeHouseListAPI =ExchangeHouseListAPI();
  ExchangeHouseModel? _exchangeHouseModel;
  bool isLoading = true;
  int _totalExchangeHouseLength = 0;
  bool _isResultAvailable=true;
  String? exchangeHouseName;
  String? serviceId;
  num? flatFee;
  String? errorMessage;

  num? selectedExchangeRate;
  String selectedExchangeHouse="y";

  num fee = 0;

  int get getTotalLength => _totalExchangeHouseLength;
  bool get getIsResultIsEmpty => _isResultAvailable;
  ExchangeProductModel? _productModel;
  ExchangeHouseModel? get getExchangeHouseModel => _exchangeHouseModel;
  ExchangeProductModel? get getProductModel => _productModel;

  void selectExchangeHouse(ExchangeProductModel productModel){
    _productModel = productModel;
    exchangeHouseName = productModel.name.toString();
flatFee =productModel.fee!.feeFlat;
    serviceId = productModel.serviceId;
    selectedExchangeHouse = productModel.id.toString();
    selectedExchangeRate = productModel.fee!.fxRate!;
    notifyListeners();
  }
  void deSelectExchangeHouse(ExchangeProductModel productModel){
    exchangeHouseName = "";
    fee = 0;
    serviceId = null;
    selectedExchangeHouse = "deSelected";
    selectedExchangeRate = 0;
    notifyListeners();
  }


  Future<void> getExchangeHouseList({
    required BuildContext context,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();
      
      final listData = await _exchangeHouseListAPI.getExchangeHouseList(fromCurrency: fromCurrency, toCurrency: toCurrency);
      
      print("📦 Exchange House API Response received");
      
      if (listData != null) {
        // Handle both single object and array responses from the API
        Map<String, dynamic> processedData = Map<String, dynamic>.from(listData);
        if (processedData['result'] != null && processedData['result'] is Map) {
          print("🔄 Wrapping single 'result' object into a list");
          processedData['result'] = [processedData['result']];
        }
        
        _exchangeHouseModel = ExchangeHouseModel.fromJson(processedData);
        _isResultAvailable = _exchangeHouseModel?.result == null || _exchangeHouseModel!.result!.isEmpty;

        print("📊 isResultEmpty: $_isResultAvailable");
        if (_isResultAvailable == false && 
            _exchangeHouseModel?.result?.isNotEmpty == true &&
            _exchangeHouseModel!.result![0].products != null) {
          _totalExchangeHouseLength = _exchangeHouseModel!.result![0].products!.length;
          
          if (_totalExchangeHouseLength > 0) {
            selectExchangeHouse(_exchangeHouseModel!.result![0].products!.first);
            _productModel = _exchangeHouseModel!.result![0].products!.first;
          }
          
          print("✅ Total Exchange Products found: $_totalExchangeHouseLength");
        } else {
          print("⚠️ No products found in the result");
          _totalExchangeHouseLength = 0;
        }
      } else {
        _exchangeHouseModel = null;
        _isResultAvailable = true;
        _totalExchangeHouseLength = 0;
        print("❌ Exchange house API returned null or invalid data");
      }
      
      print("total length $_totalExchangeHouseLength");
      isLoading = false;
      notifyListeners();
    } catch (error) {
      print("Exchange house API error: $error");
      if (error is DioError && error.response != null) {
        errorMessage = error.response?.data['message']?.toString();
      } else {
        errorMessage = error.toString();
      }
      _exchangeHouseModel = null;
      _isResultAvailable = true;
      _totalExchangeHouseLength = 0;
      isLoading = false;
      notifyListeners();
    }
  }
}
