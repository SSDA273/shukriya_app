import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/billers/recent_billers_api.dart';
import 'package:unitey_app/models/sub_recent_model/sub_recent_model.dart';

class RecentBillersNotifier extends ChangeNotifier {
  final RecentBillersAPI _recentBillersAPI = RecentBillersAPI();
  SubRecentModel? _subRecentModel;
  SubRecentModel? get getRecentBillersList => _subRecentModel;
  bool isLoading = true;

  Future<void> getRecentBillerList({
    required BuildContext context,
    required String serviceSubcategoryId,
  }) async {
    try {
      isLoading = true;
      final data = await _recentBillersAPI.recentBillers(serviceSubcategoryId: serviceSubcategoryId);
      _subRecentModel = SubRecentModel.fromJson(data);
      isLoading = false;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
