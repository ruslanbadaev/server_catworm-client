import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/services/storage_service.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:http/http.dart' as http;

Random random = new Random();

class LoopService {
  static startLoop(ServerCardsNotifier notifier) {
    Timer.periodic(new Duration(seconds: 3), (timer) {
      print('start loop');
      List<String> ips = StorageService.getIPs();

      for (String ip in ips) {
        Map item = getItem();
        item['ip'] = ip;
        notifier.setItem(ip, getItem());
      }
    });
  }

  static Map<String, dynamic> getItem() {
    return {
      'name': 'Test 3',
      'ip': '127.0.0.1:8080',
      'currDisk': random.nextInt(12000),
      'totalDisk': 12000,
      'currCPU': random.nextInt(100),
      'totalCPU': 100,
      'currRAM': random.nextInt(4000),
      'totalRAM': 4000,
    };
  }
}
