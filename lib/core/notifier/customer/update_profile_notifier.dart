import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/customer_api/update_profile_api.dart';

class UpdateProfileNotifier extends ChangeNotifier {
  final UpdateProfileAPI _updateProfileAPI= UpdateProfileAPI();

  Future<void> getCustomerDetails({
    required BuildContext context,
    required String profileImage,
  }) async {
    try {

      final detailsData = await _updateProfileAPI.updateProfile(profileImage: profileImage);

      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}
