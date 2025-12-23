import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/customer_id_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';

class CustomerIdNotifier extends ChangeNotifier {
final CustomerIdAPI _customerIdAPI= CustomerIdAPI();
final CacheService _cacheService = CacheService();

  Future<void> getCustomerID() async {
    try {
      final customerId=await _cacheService.readCache(key: "customerId");
      final customerData = await _customerIdAPI.getCustomerId(customerId:customerId );
      final statusCode = customerData["statusCode"];
      if(statusCode == 200){
        // await _cacheService.writeCache(key: "token", value: userToken);
      }
    }catch(error){
      rethrow;
    }
  }
}
