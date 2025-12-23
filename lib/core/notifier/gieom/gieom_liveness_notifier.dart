
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/core/api/gieom/gieom_liveness_api.dart';
import 'package:unitey_app/core/api/gieom/gieom_upload_front_api.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_token_notifier.dart';

import '../../../constant/style_manager.dart';

class GieomLivenessNotifier extends ChangeNotifier {
final GieomLivenessAPI gieomLivenessAPI = GieomLivenessAPI();
Future<String?> checkLiveness({
    required BuildContext context,
  required bool isIos,
    required XFile video,
  }) async {
    try {
      final userToken=context.read<GieomTokenNotifier>().getGieomToken;

      final otpData = await gieomLivenessAPI.checkLiveness(userId: userToken!, isIos: isIos, video: video);
      final message = otpData['message'];
      if (message == "Success") {
        print("Successfully  checked");
        return message;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message,
          style: getBoldStyle(color: ColorManager.white),),
        backgroundColor: ColorManager.red,));
      }
    }catch(error){
      rethrow;
    }
    return null;}
}
