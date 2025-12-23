import 'package:app_settings/app_settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthService {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate({required BuildContext context}) async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      //if its not work delete this/////
      List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();

      if(availableBiometrics.contains(BiometricType.face)){
        return await _auth.authenticate(

          // androidAuthStrings: const AndroidAuthMessages(
          //   signInTitle: 'Face Id Required',
          //   goToSettingsButton: 'settings',
          //   goToSettingsDescription: 'Please set up your Face ID.',
          // ),
          localizedReason: 'Scan Face to Login',
          // useErrorDialogs: false,
          // biometricOnly: true,
          // stickyAuth: true,
          // iOSAuthStrings: const IOSAuthMessages(
          //     cancelButton: 'cancel',
          //     goToSettingsButton: 'settings',
          //     goToSettingsDescription: 'Please set up your Face ID.',
          //     lockOut: 'Please re-enable your Face ID')
        );
      }else{
      //to this/////
      return await _auth.authenticate(
        // androidAuthStrings: const AndroidAuthMessages(
        //   signInTitle: 'Finger Print Required',
        //   goToSettingsButton: 'settings',
        //   goToSettingsDescription: 'Please set up your Finger Print.',
        // ),
        localizedReason: 'Scan Finger to Authenticate',
        // useErrorDialogs: false,
        // biometricOnly: true,
        //   stickyAuth: true,
        //   iOSAuthStrings: const IOSAuthMessages(
        //   cancelButton: 'cancel',
        //       goToSettingsButton: 'settings',
        //       goToSettingsDescription: 'Please set up your Touch ID.',
        //       lockOut: 'Please re-enable your Touch ID')
      );
      }
    } on PlatformException catch (e) {
      if(e.code == auth_error.notAvailable){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
          backgroundColor: Colors.red,
          content:
          Text("Finger print / Face Id not available "),
        ));
        AppSettings.openAppSettings(type: AppSettingsType.security);
      }else if(e.code == auth_error.passcodeNotSet){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
          backgroundColor: Colors.red,
          content:
          Text("Finger print / Face Id not set "),
        ));
        AppSettings.openAppSettings(type: AppSettingsType.security);
      }else if(e.code == auth_error.notEnrolled){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
          backgroundColor: Colors.red,
          content:
          Text("Finger print / Face Id not enrolled "),
        ));
      }
     final data=await _auth.isDeviceSupported();
      print("finger print error ${e.code} $data");
      return false;
    }
  }
}
