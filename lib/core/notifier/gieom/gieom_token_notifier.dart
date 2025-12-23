import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/gieom/gieom_token_generate_api.dart';

class GieomTokenNotifier extends ChangeNotifier {
  final GieomTokenGenerateAPI _generateAPI = GieomTokenGenerateAPI();
  bool isLoading = false;
  String? _gieomToken;

  String? get getGieomToken=>_gieomToken;

  Future<void> generateGieomToken({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      final data = await _generateAPI.getGieomToken();
      final message = data['message'];
      if(message == 'Success'){
        _gieomToken = data['result']['id'];
        notifyListeners();
        print("Gieom token is $_gieomToken");
      }

      isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
    }
  }
}
