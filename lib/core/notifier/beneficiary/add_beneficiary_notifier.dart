import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/beneficiary/add_beneficiary_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';

class AddBeneficiaryNotifier extends ChangeNotifier {
  final AddBeneficiaryAPI _addBeneficiaryAPI = AddBeneficiaryAPI();
  final CacheService _cacheService = CacheService();


  Future<String?> addBeneficiary({
    required String nickName,
    required String fullName,
    required String countryCode,
    required beneficiaryTypeId,
    String? bankName,
    String? accountNumber,
    String? accountType,
    String? depositMethod,
    String? bankCode,
    String? address,
    String? city,
    String? state,
    String? currencyType,
    String? postcode,
    String? dob,
    String? walletId,
    String? walletType,
    String? email,
    String? contact,
    String? identityType,
    String? identityIssueCountry,
    String? identityId,
    String? identityAdditionalDetails,
    String? identityIssue,
    String? identityExpiry,
    String? cardNumber,
    String? relationship,
    String? localLanguage,
    String? logo,
  }) async {
    try {
      final customerId=await _cacheService.readCache(key: "customerId");
      final data = await _addBeneficiaryAPI.addBeneficiary(
        customerId: customerId,
        nickName: nickName,
        fullName: fullName,
        countryCode: countryCode,
        beneficiaryTypeId: beneficiaryTypeId,
        bankName: bankName,
        accountNumber: accountNumber,
        accountType: accountType,
        depositMethod: depositMethod,
        bankCode: bankCode,
        address: address,
        city: city,
        state: state,
        currencyType: currencyType,
        postcode: postcode,
        dob: dob,
        walletId: walletId,
        walletType: walletType,
        email: email,
        contact: contact,
        identityType: identityType,
        identityIssueCountry: identityIssueCountry,
        identityId: identityId,
        identityAdditionalDetails: identityAdditionalDetails,
        identityIssue: identityIssue,
        identityExpiry: identityExpiry,
        cardNumber: cardNumber,
        relationship: relationship,
        localLanguage: localLanguage,
        logo: logo,
      );
      final message = data["message"];

      final statusCode = data["statusCode"];
      if (message == "Beneficiary name already exists") {
        return "Name";
      }else if(statusCode ==200){
        final referenceNumber = data["result"]['reference_number'];
        return referenceNumber;
      }
      return "Error";
    } catch(error){
      rethrow;
    }
  }
}
