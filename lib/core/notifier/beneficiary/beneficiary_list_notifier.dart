import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/beneficiary/beneficiary_list_api.dart';
import 'package:unitey_app/models/beneficiary_model/beneficiary_model.dart';

class BeneficiaryListNotifier extends ChangeNotifier {
  final BeneficiaryListAPI _beneficiaryListAPI = BeneficiaryListAPI();
  BeneficiaryModel? _beneficiary;
  bool isLoading = false;
  int _totalShiftLength = 0;

  int get getTotalLength => _totalShiftLength;

  BeneficiaryModel? get getBeneficiaryModel => _beneficiary;

  Future<void> getBeneficiaryList() async {
    try {
      isLoading = true;
      print("📋 Calling beneficiary list API...");
      final listData = await _beneficiaryListAPI.getBeneficiaryList();
      print("📋 Raw beneficiary API response: $listData");
      if (listData != null) {
        _beneficiary = BeneficiaryModel.fromJson(listData);
        _totalShiftLength = _beneficiary?.result?.length ?? 0;
        print("📋 Parsed beneficiaries length $_totalShiftLength");
      } else {
        print("📋 No beneficiary data received");
        _totalShiftLength = 0;
      }
      isLoading = false;
      notifyListeners();
    } catch(error){
      print("❌ Error parsing beneficiary data: $error");
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
