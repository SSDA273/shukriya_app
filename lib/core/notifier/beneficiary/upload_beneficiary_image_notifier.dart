import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/beneficiary/upload_beneficiary_image_api.dart';
import 'package:unitey_app/models/beneficiary_image_upload_model/beneficiary_image_upload_model.dart';

class UploadImageNotifier extends ChangeNotifier {
  final UploadImageAPI _uploadImageAPI = UploadImageAPI();
  BeneficiaryImageUploadModel? _beneficiaryImageUploadModel;

  Future<BeneficiaryImageUploadModel?> uploadImage({
    required BuildContext context,
    required File image,
    required String type,
  }) async {
    try {
      final listData = await _uploadImageAPI.uploadImage(image: image,type: type);
      _beneficiaryImageUploadModel = BeneficiaryImageUploadModel.fromJson(listData);
      notifyListeners();
      return _beneficiaryImageUploadModel;
    } catch(error){
      rethrow;
    }
  }
}
