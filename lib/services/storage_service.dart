import 'dart:convert';
import 'package:server_catworm/models/server_card.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:http/http.dart' as http;

class StorageService {
  getServerCards(ServerCardsNotifier notifier) {
    List<String> ips = ['127.0.0.1:80', '127.0.0.1:3000', '127.0.0.1:8080'];
    Map<String, Map<String, dynamic>> serverCardsMap = {
      '127.0.0.1:80': {
        'name': 'Test',
        'ip': '127.0.0.1:80',
        'currDisk': 2233,
        'totalDisk': 5000,
        'currCPU': 12,
        'totalCPU': 100,
        'currRAM': 281,
        'totalRAM': 4000,
      },
      '127.0.0.1:3000': {
        'name': 'Test 2',
        'ip': '127.0.0.1:3000',
        'currDisk': 123,
        'totalDisk': 5000,
        'currCPU': 43,
        'totalCPU': 100,
        'currRAM': 5290,
        'totalRAM': 8000,
      },
      '127.0.0.1:8080': {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 8500,
        'totalDisk': 12000,
        'currCPU': 88,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
    };
    for (String ip in ips) {
      notifier.setItem(ip, serverCardsMap[ip]);
    }
/*     for (Map<String, dynamic> item in serverCards) {
      notifier.addItem(ServerCard.fromMap(item));
    } */
  }
}



/*  List<Map<String, dynamic>> serverCards = [
      {
        'name': 'Test',
        'ip': '127.0.0.1:80',
        'currDisk': 2233,
        'totalDisk': 5000,
        'currCPU': 12,
        'totalCPU': 100,
        'currRAM': 281,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 2',
        'ip': '127.0.0.1:3000',
        'currDisk': 123,
        'totalDisk': 5000,
        'currCPU': 43,
        'totalCPU': 100,
        'currRAM': 5290,
        'totalRAM': 8000,
      },
      {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 8500,
        'totalDisk': 12000,
        'currCPU': 88,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 8500,
        'totalDisk': 12000,
        'currCPU': 88,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 8500,
        'totalDisk': 12000,
        'currCPU': 88,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
      {
        'name': 'Test 3',
        'ip': '127.0.0.1:8080',
        'currDisk': 8500,
        'totalDisk': 12000,
        'currCPU': 88,
        'totalCPU': 100,
        'currRAM': 2890,
        'totalRAM': 4000,
      },
    ]; */