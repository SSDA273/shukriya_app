import 'package:flutter/material.dart';
import 'package:unitey_app/constant/app_routes.dart';
import '../../api/auth/pin_login_api.dart';
import '../../services/cache_services.dart';

class PinLoginNotifier extends ChangeNotifier {
  final PinLoginApi _pinLoginApi = PinLoginApi();
  final CacheService _cacheService = CacheService();
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  Future<void> pinLogin({
    required BuildContext context,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final username = await _cacheService.readCache(key: "userName");
      final userData = await _pinLoginApi.pinLogin(
          username: username, password: password,
      );
      final statusCode = userData['statusCode'];
      if (statusCode == 200) {
        Navigator.pop(context);
        _isLoading = false;
        notifyListeners();
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   behavior: SnackBarBehavior.floating,
        //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        //   content: Text("Login Success"),
        //   backgroundColor: Colors.green,
        // ));
        Navigator.of(context).pushNamedAndRemoveUntil(mainRoute, (route) => false);
      } else if (statusCode == 401) {
        Navigator.pop(context);
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(backgroundColor: Colors.red, content: Text("Invalid Pin")));
      } else {
        _isLoading = false;
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red,
                content: Text("Something went wrong")));
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}