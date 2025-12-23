import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/colors_api/colors_api.dart';
import 'package:unitey_app/models/brand_colors_model/colors_model.dart';

class ColorsNotifier extends ChangeNotifier {
  final ColorsAPI _colorsAPI = ColorsAPI();
ColorsModel? _colorsModel;
  bool isLoading = true;

  ColorsModel? get getColorsModel => _colorsModel;

  Future<void> getColors({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final detailsData = await _colorsAPI.getColors();
      _colorsModel = ColorsModel.fromJson(detailsData);
      // _totalShiftLength = _beneficiary!.result!.length;
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
