import 'dart:convert';
import 'package:server_catworm/models/server_card.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:http/http.dart' as http;

class StorageService {
  getServerCards(ServerCardsNotifier notifier) {
    List<String> ips = getIPs();
    Map<String, Map<String, dynamic>> serverCardsMap = {
      '134.0.117.33:666': {
        'name': 'Test Server',
        'ip': '134.0.117.33:666',
        'currDisk': 2233,
        'totalDisk': 5000,
        'currCPU': 12,
        'totalCPU': 100,
        'currRAM': 281,
        'totalRAM': 4000,
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpcCI6IjEzNC4wLjExNy4zMyIsImtleSI6IjU4NDBmNzMwOWJhZjgyNWQ2N2M5MzEwMjBmNzFjNzE0YmE0NTE5NDEiLCJpYXQiOjE2MjI3NTA5MDV9.gyRMGXshG0BX_Zj-YhVdhHm6aZl7qz-s64CLWbHOCDw',
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
        'token': '',
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
        'token': '',
      },
    };
    for (String ip in ips) {
      notifier.setItem(ip, serverCardsMap[ip]);
    }
/*     for (Map<String, dynamic> item in serverCards) {
      notifier.addItem(ServerCard.fromMap(item));
    } */
  }

  static List<String> getIPs() {
    List<String> ips = ['134.0.117.33:666', '127.0.0.1:3000', '127.0.0.1:8080'];
    return ips;
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