import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/customer_api/customer_profile_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/customer_profile_model/customer_profile_model.dart';

class CustomerProfileNotifier extends ChangeNotifier {
  final CustomerProfileAPI _customerProfileAPI = CustomerProfileAPI();
final CacheService _cacheService = CacheService();
  CustomerProfileModel? _customerProfileModel;
  bool isLoading = true;
  String? _customerUserName;
  String? _customerNumber;
  String? _customerFistName;
  String? _customerLastName;
  String? _customerEmail;
  String? _customerEmirates;
  String? _customerImage;
String? get getCustomerNumber=>_customerNumber;
String? get getCustomerImage=>_customerImage;
String? get getCustomerName=>_customerFistName;
  CustomerProfileModel? get getCustomerProfileModel => _customerProfileModel;

  Future<void> getCustomerDetails({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;

      final detailsData = await _customerProfileAPI.getCustomerProfile();
      _customerProfileModel = CustomerProfileModel.fromJson(detailsData);
      _customerUserName = _customerProfileModel!.result!.username;
      _customerNumber = _customerProfileModel!.result!.mobileNumber;
      _customerFistName= _customerProfileModel!.result!.firstName;
      _customerLastName= _customerProfileModel!.result!.lastName;
      _customerEmail= _customerProfileModel!.result!.email;
      _customerEmirates= _customerProfileModel!.result!.emirate;
      _customerImage= _customerProfileModel!.result!.profileImage;
      // _totalShiftLength = _beneficiary!.result!.length;
      _cacheService.writeCache(key: "firstName", value: _customerFistName??"");
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
