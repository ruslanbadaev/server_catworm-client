import 'package:flutter/material.dart';
import 'package:server_catworm/components/server_card/server_card_view_model.dart';
import 'package:server_catworm/models/server_card.dart';

class ServerCardView extends StatefulWidget {
  final ServerCard serverCard;

  ServerCardView({@required this.serverCard});

  @override
  State createState() {
    return ServerCardViewState(serverCard);
  }
}

class ServerCardViewState extends State<ServerCardView> {
  ServerCard serverCard;
  ServerCardViewModel serverCardViewModel;

  ServerCardViewState(this.serverCard) {
    serverCardViewModel = new ServerCardViewModel();
    serverCardViewModel.setServerCard(serverCard);
  }

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
