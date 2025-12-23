import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/beneficiary/beneficiary_list_api.dart';
import 'package:unitey_app/core/api/beneficiary/delete_beneficiary_api.dart';
import 'package:unitey_app/models/beneficiary_model/beneficiary_model.dart';

class DeleteBeneficiaryNotifier extends ChangeNotifier {
final DeleteBeneficiaryAPI _beneficiaryAPI=DeleteBeneficiaryAPI();


  Future<String> deleteBeneficiary({
    required BuildContext context,
    required String id,
  }) async {
    try {
      final listData = await _beneficiaryAPI.deleteBeneficiary(id: id);
      final statusCode = listData["statusCode"];
      if(statusCode == 200){
        return "ok";
      }else{
        return "Not Ok";
      }

    } catch(error){
      rethrow;
    }
  }
}
