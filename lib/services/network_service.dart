import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/services/storage_service.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:http/http.dart' as http;

Random random = new Random();

class NetworkService {
  static execRequest(/* ServerCardsNotifier notifier, script, ip */) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpcCI6IjEzNC4wLjExNy4zMyIsImtleSI6IjU4NDBmNzMwOWJhZjgyNWQ2N2M5MzEwMjBmNzFjNzE0YmE0NTE5NDEiLCJpYXQiOjE2MjI3NTA5MDV9.gyRMGXshG0BX_Zj-YhVdhHm6aZl7qz-s64CLWbHOCDw',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://134.0.117.33:666/script'));
    request.body = json.encode({"script": "node -v"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
