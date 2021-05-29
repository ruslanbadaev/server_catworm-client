import 'package:server_catworm/models/server_card.dart';
import 'package:flutter/material.dart';

class ServerCardViewModel {
  ServerCard _serverCard;

  setServerCard(ServerCard serverCard) {
    _serverCard = serverCard;
  }

  int getPercent(int curr, int total) {
    return int.parse((curr / total * 100).toStringAsFixed(0));
  }

  Color getColor(int percent) {
    if (percent <= 50)
      return Colors.green;
    else if (percent <= 85)
      return Colors.orange;
    else
      return Colors.red;
  }

  ServerCard get serverCard => _serverCard;
}
