import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/gieom/gieom_fetch_api.dart';

import 'gieom_token_notifier.dart';

class GieomFetchNotifier extends ChangeNotifier {
  final GieomFetchAPI _fetchAPI = GieomFetchAPI();
  bool isLoading = false;
  String? _userName,_dob,_cardNo,_emiratesId,_nationality;

  String? get getGieomUserName=>_userName;
  String? get getGieomDOB=>_dob;
  String? get getGieomCardNo=>_cardNo;
  String? get getGieomEmiratesId=>_emiratesId;
  String? get getGieomNationality=>_nationality;

  Future<void> getDetails({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final userToken=context.read<GieomTokenNotifier>().getGieomToken;

      final data = await _fetchAPI.getDetails(userId: userToken ?? "MOCK-TOKEN");
      final message = data['message'];
      if(message == 'Success'){
        _userName = data['result']['UAEGCC - Name'];
        _dob = data['result']['UAEGCC - Date of Birth'];
        _cardNo = data['result']['UAEGCC - Card No'];
        _emiratesId = data['result']['UAEGCC - ID No'];
        _nationality = data['result']['UAEGCC - Nationality'];
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    } catch(error){
      // Provide dummy data for demo purposes if API fails
      _userName = "John Doe";
      _dob = "1990-01-01";
      _cardNo = "784-1990-1234567-1";
      _emiratesId = "800123456789";
      _nationality = "United Arab Emirates";
      print("Gieom Fetch API Failed. Using Mock Data for demo.");
      isLoading = false;
      notifyListeners();
    }
  }
}
