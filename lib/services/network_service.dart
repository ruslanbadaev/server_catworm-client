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
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpcCI6Ijc3Ljg4LjU2LjI2Iiwia2V5IjoiMDI4ZDcxMWYwODZjYjU5Y2RlM2VhMTZlNDdiZGRmY2FhNGNlZWY2MyIsImlhdCI6MTYyMjczMTcyMn0.PSu7_Ro2e6hdazm9RrBBrGR1Mj9NQzpzoVI0ZKy_jmA',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://localhost:666/script'));
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
