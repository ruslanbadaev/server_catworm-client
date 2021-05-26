import 'package:flutter/material.dart';
import 'package:server_catworm/models/server_card.dart';

class ServerCardsNotifier with ChangeNotifier {
  List<ServerCard> _cards = [];

  List<ServerCard> getAllItems() {
    return _cards;
  }

  void addItems(List<ServerCard> items) {
    _cards = items;
    notifyListeners();
  }

  void addItem(ServerCard item) {
    _cards.add(item);
    notifyListeners();
  }
}
