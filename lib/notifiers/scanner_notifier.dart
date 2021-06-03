import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:server_catworm/models/scanner.dart';

class ScannersNotifier with ChangeNotifier {
  void setNewServer(token) async {
    await GetStorage.init();
    final storage = GetStorage();
    storage.write('token', token);
  }
}
