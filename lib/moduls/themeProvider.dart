import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{

  ThemeProvider() {
    loadFromPrefs();
  }

  final String key = "theme";
  SharedPreferences? prefs;

  bool _darkTheme = true;

  bool get darkTheme { return _darkTheme;}

  bool isEn = true;

  changeLan(bool lan){
    isEn = lan;
    notifyListeners();
  }


  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs!.getBool(key) ?? true;
    print('after $_darkTheme');
    notifyListeners();
  }
  _initPrefs() async {
    prefs ??= await SharedPreferences.getInstance(); // if prefs = null it take a value
  }

  toggleTheme(bool value) {
    debugPrint("$darkTheme");
    _darkTheme = value;
    saveToPrefs();
    notifyListeners();
  }


  saveToPrefs() async {
    await _initPrefs();
    prefs!.setBool(key, _darkTheme);
    debugPrint('----------------');
    print(prefs!.get(key));
  }
}