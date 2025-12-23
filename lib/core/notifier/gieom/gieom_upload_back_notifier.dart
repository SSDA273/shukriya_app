
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/gieom/gieom_upload_back_api.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_token_notifier.dart';

class GieomUploadBackNotifier extends ChangeNotifier {
  final GieomUploadBackAPI _uploadBackAPI = GieomUploadBackAPI();
  bool _isValidated = false;
  bool get getIsValidated => _isValidated;
  Future<void> uploadBackImage({
    required BuildContext context,
    required String base64Image,
  }) async {
    try {
      final userToken=context.read<GieomTokenNotifier>().getGieomToken;
      print("userToken $userToken");
      // final scopeNotifier = Provider.of<ScopeNotifier>(context, listen: false);
      final otpData = await _uploadBackAPI.uploadBackImage(userToken: userToken!, base64Image: base64Image);
      final message = otpData['message'];
      if (message == "Success") {
        _isValidated = true;
        print("Successfully generated");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    }catch(error){
      rethrow;
    }}
}
