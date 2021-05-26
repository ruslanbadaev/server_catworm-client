import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:server_catworm/components/scanner/scanner_view.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:server_catworm/notifiers/theme_notifier.dart';
import 'package:server_catworm/services/scanner_service.dart';
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
    ScannersNotifier scannerNotifier =
        Provider.of<ScannersNotifier>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScannersNotifier scannerNotifier = Provider.of<ScannersNotifier>(context);
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("CAT WORM"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/add_scanner");
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
              child: Column(
                children: [
                  InkWell(
                      onTap: () => {Navigator.pushNamed(context, "/terminal")},
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(24),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text('Server name'),
                              Text('127.0.0.1'),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text('Add server'),
        icon: Icon(Icons.qr_code_2_rounded),
      ),
    );
  }
}
