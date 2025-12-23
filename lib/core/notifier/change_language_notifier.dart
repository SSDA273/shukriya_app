import 'package:flutter/material.dart';

class ChangeLanguageNotifier extends ChangeNotifier {
  Locale _currentLanguage = const Locale("en");
  Locale get currentLocale => _currentLanguage;
  void changeLocale(String _locale) {
    _currentLanguage = Locale(_locale);
    notifyListeners();
  }
}
