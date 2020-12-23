import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData _greenTheme = ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));
  final ThemeData _redTheme = ThemeData(
      primaryColor: Colors.red,
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));

  static SharedPreferences _sharedPref;
  bool _isGreen = true;

  void switchTheme(bool selected) {
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  ThemeData get selectedThemeData => _isGreen ? _greenTheme : _redTheme;
  bool get isGreen => _isGreen;

  /// Shared Preferences Methods
  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPref.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() {
    print('loadTheme.. fonksiyonu çalıştı');
    _isGreen = _sharedPref.getBool('themeData') == true;
  }
}
