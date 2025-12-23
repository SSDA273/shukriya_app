import 'package:flutter/material.dart';
import 'package:unitey_app/core/api/auth/sign_up/emirates_id_api.dart';

import '../../../../models/sign_up_model/sign_up_model.dart';

class EmiratesIdNotifier extends ChangeNotifier {
  final EmiratesIdApi _emiratesIdApi = EmiratesIdApi();
  late SignUpModel? _signUpModel;

  SignUpModel? get getSignUpModel => _signUpModel;
   bool _isLoading=false;
   bool get getIsLoading => _isLoading;

  Future<String?> emiratesId({
    required BuildContext context,
    required String emiratesId,
    required String profileImage,
    required String userName,
    required String password,
  }) async {
    try {
      _isLoading=true;
      notifyListeners();
      final otpData = await _emiratesIdApi.emiratesId(
          emiratesId: emiratesId, userName: userName, password: password,profileImage:profileImage);
      final statusCode = otpData['statusCode'];
      final message = otpData['message'];
      print("message is $message");
      if (statusCode == 200) {
        _isLoading=false;
        _signUpModel = SignUpModel.fromJson(otpData);
        notifyListeners();
        return "ok";
      }else if(statusCode == 409){
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(message)));
      } else {
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
      return null;
    } catch (error) {
      _isLoading=false;
      notifyListeners();
      rethrow;
    }
  }
}
