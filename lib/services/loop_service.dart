import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:http/http.dart' as http;

Random random = new Random();

class LoopService {
  static loop(ServerCardsNotifier notifier) {
    Timer timer = new Timer(new Duration(seconds: 5), () {
      int randomNumber = random.nextInt(90) + 10;
      print('wow');
    });
  }
}
