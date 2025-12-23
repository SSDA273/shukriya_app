import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/core/api/auth/auth_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationApi _authenticationApi = AuthenticationApi();
  final CacheService _cacheService = CacheService();
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = getJsonFromJWT(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }
    return payloadMap;
  }

  String getJsonFromJWT(String splittedToken) {
    String normalizedSource = base64Url.normalize(splittedToken);
    return utf8.decode(base64Url.decode(normalizedSource));
  }

  Future<void> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      _isLoading=true;
      notifyListeners();
      // final scopeNotifier = Provider.of<ScopeNotifier>(context, listen: false);
      final userData = await _authenticationApi.login(
          username: username, password: password);

      final message = userData['message'];
      final statusCode = userData['statusCode'];

      print("ii $message $statusCode");
      if (statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        final userToken = userData['result']['access_token'];
        final refreshToken = userData['result']['refresh_token'];
        await _cacheService.writeCache(key: "token", value: userToken);
        await _cacheService.writeCache(key: "refresh", value: refreshToken);
        await _cacheService.writeCache(key: "onBoarded", value: "ok");

        // final token = await cacheService.readCache(key: "token");
        final payloadMap = parseJwt(userToken);
        print("customer id is ${payloadMap['sub']}");
        final _customerId = payloadMap['sub'];
        // final userName = payloadMap['name'];
        // final userEmail = payloadMap['email'];
        await _cacheService.writeCache(key: "customerId", value: _customerId);
        await _cacheService.writeCache(key: "userName", value: username);
        // await cacheService.writeCache(key: "userName", value: userName);
        // await cacheService.writeCache(key: "userEmail", value: userEmail);
        // scopeNotifier.addTokenToScope(token: token);
        Navigator.of(context).pushNamedAndRemoveUntil(mainRoute, (route) => false);
      }else if(statusCode == 401){
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(message)));
      } else {
        _isLoading=false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red, content: Text("Something went wrong")));
      }
    } catch (error) {
      _isLoading=false;
      notifyListeners();
      rethrow;
    }
  }

}
