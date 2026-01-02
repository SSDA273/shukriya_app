import 'dart:io';
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
  String? _toCountry = 'IN';
  num? flatFee;

  num? selectedExchangeRate;
  String selectedExchangeHouse="y";

  num fee = 0;

  int get getTotalLength => _totalExchangeHouseLength;
  bool get getIsResultIsEmpty => _isResultAvailable;
  String? get getToCountry => _toCountry;
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
      notifyListeners();
      
      // Determine toCountry based on currency
      switch (toCurrency) {
        case 'INR':
          _toCountry = 'IN';
          break;
        case 'PKR':
          _toCountry = 'PK';
          break;
        case 'PHP':
          _toCountry = 'PH';
          break;
        case 'BDT':
          _toCountry = 'BD';
          break;
        default:
          _toCountry = 'IN';
      }
      
      final listData = await _exchangeHouseListAPI.getExchangeHouseList(fromCurrency: fromCurrency, toCurrency: toCurrency);
      
      if (listData != null) {
        // Handle both single object and array responses from the API
        Map<String, dynamic> processedData = Map<String, dynamic>.from(listData);
        if (processedData['result'] != null && processedData['result'] is Map) {
          // If result is a single object (current API response), extract serviceId
          final resultObj = processedData['result'] as Map<String, dynamic>;
          // Use service_id from current API structure
          serviceId = resultObj['service_id']?.toString();
          // Wrap in array for model compatibility
          processedData['result'] = [resultObj];
        }
        
        _exchangeHouseModel = ExchangeHouseModel.fromJson(processedData);
        _isResultAvailable = _exchangeHouseModel?.result?.isEmpty ?? true;

        print("isResultAvailable $_isResultAvailable");
        if (_isResultAvailable == false && 
            _exchangeHouseModel?.result?.isNotEmpty == true &&
            _exchangeHouseModel!.result![0].products?.isNotEmpty == true) {
          _totalExchangeHouseLength = _exchangeHouseModel!.result![0].products!.length;
          selectExchangeHouse(_exchangeHouseModel!.result![0].products!.first);
          _productModel = _exchangeHouseModel!.result![0].products!.first;
          print("Total Exchange Length $_totalExchangeHouseLength");
        } else {
          _totalExchangeHouseLength = 0;
        }
      } else {
        _exchangeHouseModel = null;
        _isResultAvailable = true;
        _totalExchangeHouseLength = 0;
        print("Exchange house API returned null data");
      }
      
      print("total length $_totalExchangeHouseLength");
      isLoading = false;
      notifyListeners();
    } catch (error) {
      print("Exchange house API error: $error");
      _exchangeHouseModel = null;
      _isResultAvailable = true;
      _totalExchangeHouseLength = 0;
      isLoading = false;
      notifyListeners();
    }
  }
}
