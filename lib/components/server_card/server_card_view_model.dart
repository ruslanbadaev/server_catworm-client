import 'package:server_catworm/models/server_card.dart';

class ServerCardViewModel {
  ServerCard _serverCard;

  setServerCard(ServerCard serverCard) {
    _serverCard = serverCard;
  }

  ServerCard get serverCard => _serverCard;
}
