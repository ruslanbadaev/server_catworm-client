import 'package:flutter/material.dart';
import 'package:server_catworm/models/message.dart';
import 'package:server_catworm/services/scanner_service.dart';

class TerminalNotifier with ChangeNotifier {
  Map<String, List<Message>> _messages = {};
  String _currIp = '';
  void addMessage(Message message, String ip) {
    if (_messages[ip] == null) _messages[ip] = [];
    _messages[ip].add(message);
    notifyListeners();
  }

  List<Message> getMessages(String ip) {
    if (_messages[ip] == null) _messages[ip] = [];
    return _messages[ip];
  }

  String getDate() {
    DateTime now = new DateTime.now();
    return new DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second)
        .toString();
  }

  void setCurrIp(String ip) {
    _currIp = ip;
    notifyListeners();
  }

  String getCurrIp() {
    return _currIp;
  }
}
