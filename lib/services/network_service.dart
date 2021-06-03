import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/services/storage_service.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:http/http.dart' as http;

Random random = new Random();

class NetworkService {
  static Future<String> execRequest(script, ip, token) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://$ip/script'));
    request.body = json.encode({"script": script});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      String resp = await response.stream.bytesToString();
      print(resp);
      return json.decode(resp)['message'];
    } else {
      print(response.reasonPhrase);
      return response.reasonPhrase;
    }
  }
}
