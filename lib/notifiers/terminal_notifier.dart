import 'package:flutter/material.dart';
import 'package:server_catworm/models/message.dart';
import 'package:server_catworm/services/scanner_service.dart';

class TerminalNotifier with ChangeNotifier {
  List<Message> messages = [];

  void addMessage(Message message) {
    messages.add(message);
    notifyListeners();
  }

  List<Message> getMessages() {
    return messages;
  }

  String getDate() {
    DateTime now = new DateTime.now();
    return new DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second)
        .toString();
  }
}
