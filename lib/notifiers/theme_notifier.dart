import 'package:flutter/material.dart';
import 'package:flutter_port_scanner/services/scanner_service.dart';

class ThemeNotifier with ChangeNotifier {
  bool darkTheme = true;

  toggle() {
    darkTheme = !darkTheme;
    notifyListeners();
  }

  get() {
    return darkTheme;
  }
}
