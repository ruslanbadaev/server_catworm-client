import 'dart:convert';
import 'package:server_catworm/models/server_card.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:http/http.dart' as http;

class StorageService {
  getServerCards(ServerCardsNotifier notifier) {
    List<Map<String, dynamic>> serverCards = [
      {
        'name': 'Test',
        'ip': '127.0.0.1:80',
        'currDisk': 123,
        'totalDisk': 5000,
        'currCPU': 43,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 2',
        'ip': '127.0.0.1:3000',
        'currDisk': 123,
        'totalDisk': 5000,
        'currCPU': 43,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 123,
        'totalDisk': 5000,
        'currCPU': 43,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
    ];
    for (Map<String, dynamic> item in serverCards) {
      notifier.addItem(ServerCard.fromMap(item));
    }
  }
}
