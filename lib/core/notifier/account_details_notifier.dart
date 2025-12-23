import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/account_details_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/account_details_model/account_details_model.dart';

class AccountDetailsNotifier extends ChangeNotifier {
final AccountDetailsAPI _accountDetailsAPI = AccountDetailsAPI();
final CacheService _cacheService = CacheService();

AccountDetailsModel? _accountDetailsModel;
  bool isLoading = true;
  // int _totalShiftLength = 0;
  // int get getTotalLength => _totalShiftLength;

AccountDetailsModel? get getAccountDetailsModel => _accountDetailsModel;

  Future<void> getAccountDetails({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final customerId=await _cacheService.readCache(key: "customerId");

      final detailsData = await _accountDetailsAPI.getAccountDetails(customerId: customerId);
      _accountDetailsModel = AccountDetailsModel.fromJson(detailsData);
      // _totalShiftLength = _beneficiary!.result!.length;
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
