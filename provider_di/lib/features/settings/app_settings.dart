import 'package:flutter/cupertino.dart';

class AppSettings extends ChangeNotifier {
  AppSettings();

  bool get darkMode => _darkMode;
  bool _darkMode = true;
  set darkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
