import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/main.dart';

import '../../constant/app_routes.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  String? accessToken;
  final CacheService cacheService = CacheService();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final listOfPaths = <String>[
      '${AppAPI.baseUrl}/auth/login/customer',
      '${AppAPI.baseUrl}/auth/customer/sign_up'
    ];
    if (listOfPaths.contains(options.path.toString())) {
      return handler.next(options);
    }

    final token = await cacheService.readCache(key: "token");
    
    print("🔑 AuthInterceptor - Token: ${token != null ? 'Present (${token.length} chars)' : 'NULL'}");        
    //print("🔑 AuthInterceptor - Token: ${token != null ? 'Present (${token.length} chars)\n Token: $token' : 'NULL'}");

    print("🔑 AuthInterceptor - Request URL: ${options.path}");
    
    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
      print("🔑 AuthInterceptor - Added Authorization header");
    } else {
      print("❌ AuthInterceptor - No token found! User might not be logged in.");
    }
    // options.headers['Authorization'] = 'Bearer $token';

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if ((err.response?.statusCode == 401 &&
        err.response?.data["message"] == "Session Expired, Please Login Again")) {
      print("Token expired ");
      accessToken = null;
      cacheService.deleteCache();
      const SnackBar snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text("Session Expired"));
      snackbarKey.currentState?.showSnackBar(snackBar);
      navigatorKey.currentState!.pushNamedAndRemoveUntil(loginRoute, (route) => false);
      // if (await refreshToken()) {
      //   print("Token expired checked");
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    final refreshToken = await cacheService.readCache(key: 'refresh');
    final response =
        await _dio.post('/auth/refresh', data: {'refreshToken': refreshToken});
    print('refresh code${response.statusCode}');
    if (response.statusCode == 201) {
      accessToken = response.data;
      return true;
    } else {
      // refresh token is wrong
      print("refresh token expired");
      accessToken = null;
      cacheService.deleteCache();
      return false;
    }
  }
}
