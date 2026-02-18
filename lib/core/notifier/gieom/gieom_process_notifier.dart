import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/gieom/gieom_process_api.dart';

import 'gieom_token_notifier.dart';

class GieomProcessNotifier extends ChangeNotifier {
  final GieomProcessAPI _processAPI = GieomProcessAPI();
  bool isLoading = false;
  bool _isValidated = false;
bool get getIsValidated => _isValidated;
  Future<void> processGieom({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final userToken = context.read<GieomTokenNotifier>().getGieomToken;
      if (userToken == null) {
        throw "Session token is missing. Please restart the process.";
      }
      final data = await _processAPI.getProcessFile(userId: userToken);
      final message = data['message'];
      if (message == 'Success') {
        _isValidated = true;
        print("Processing finished");
      } else {
        throw message ?? "Unknown error during processing";
      }

      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
