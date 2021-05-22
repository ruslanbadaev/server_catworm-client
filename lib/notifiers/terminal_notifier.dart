import 'package:flutter/material.dart';
import 'package:server_catworm/services/scanner_service.dart';

class TerminalNotifier with ChangeNotifier {
  List<Map> messages;

  void addMessage(Map message) {
    messages.add(message);
    notifyListeners();
  }

  List<Map> getMessages() {
    return messages;
  }
}
