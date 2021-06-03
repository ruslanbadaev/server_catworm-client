import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:server_catworm/components/server_card/server_card_view.dart';
import 'package:server_catworm/models/server_card.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:server_catworm/notifiers/server_cards_notifier.dart';
import 'package:server_catworm/notifiers/theme_notifier.dart';
import 'package:server_catworm/notifiers/terminal_notifier.dart';
import 'package:server_catworm/services/storage_service.dart';
import 'package:server_catworm/services/loop_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    ServerCardsNotifier serverCardsNotifier =
        Provider.of<ServerCardsNotifier>(context, listen: false);
    StorageService().getServerCards(serverCardsNotifier);
    LoopService.startLoop(serverCardsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScannersNotifier scannerNotifier = Provider.of<ScannersNotifier>(context);
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    TerminalNotifier terminalNotifier = Provider.of<TerminalNotifier>(context);
    ServerCardsNotifier serverCardsNotifier =
        Provider.of<ServerCardsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("CAT WORM"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/scanner");
            },
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline_rounded),
            onPressed: () {
              themeNotifier.toggle();
            },
          ),
        ],
      ),
      body: scannerNotifier != null
          ? Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (ServerCard card
                        in serverCardsNotifier.getAllItems().values)
                      InkWell(
                        onTap: () => {
                          terminalNotifier.setCurrIp(card.ip),
                          Navigator.pushNamed(context, "/terminal"),
                        },
                        child: ServerCardView(serverCard: card),
                      ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text('Add server'),
        icon: Icon(
          Icons.qr_code_2_rounded,
        ),
      ),
    );
  }
}
