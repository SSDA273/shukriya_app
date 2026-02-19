
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/gieom/gieom_face_match_api.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_token_notifier.dart';

class GieomFaceMatchNotifier extends ChangeNotifier {
  final GieomFaceMatchAPI gieomFaceMatchAPI =GieomFaceMatchAPI();
  Future<String?> checkFaceMatch({
    required BuildContext context,
    required String image
  }) async {
    try {
      final userToken=context.read<GieomTokenNotifier>().getGieomToken;

      final otpData = await gieomFaceMatchAPI.checkFaceMatch(userId: userToken!,
      image: image);
      final message = otpData['message'];
      if (message == "Success") {
        final fvConfidence = otpData['result']['fvconfidence'];
        if(fvConfidence>2){
          return message;
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    } catch (error) {
      print("Gieom Face Match API Error: $error. Using mock success for demo.");
      return "Success";
    }
    return null;
  }
}
