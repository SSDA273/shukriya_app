import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/entity_info_api.dart';
import 'package:unitey_app/models/account_details_model/account_details_model.dart';
import 'package:unitey_app/models/entity_info_model/entity_info_model.dart';

class EntityInfoNotifier extends ChangeNotifier {
  final EntityInfoAPI _entityInfoAPI = EntityInfoAPI();

  EntityInfoModel? _entityInfoModel;
  bool isLoading = true;
  // int _totalShiftLength = 0;
  // int get getTotalLength => _totalShiftLength;

  EntityInfoModel? get getEntityInfoModel => _entityInfoModel;

  Future<void> getEntityInfo({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final detailsData = await _entityInfoAPI.getEntityInfo();
      _entityInfoModel = EntityInfoModel.fromJson(detailsData);
      // _totalShiftLength = _beneficiary!.result!.length;
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
