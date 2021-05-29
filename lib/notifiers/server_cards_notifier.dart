import 'package:flutter/material.dart';
import 'package:server_catworm/models/server_card.dart';

class ServerCardsNotifier with ChangeNotifier {
  List<ServerCard> _cards = [];
  Map<String, ServerCard> _cardsMap = {};

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

  void setItem(String ip, Map item) {
    // _cards.add(item);
    _cardsMap[ip] = ServerCard.fromMap(item);
    notifyListeners();
  }
}
