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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*       Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 14,
                                  ), */
                                  Text(
                                    'Server name',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  /*  Container(), */
                                ],
                              ),
                              Text('127.0.0.1'),
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: Colors.black12,
                                margin: EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text('FREE DISK:'),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              // Icon(Icons.memory_rounded),
                                              Text('Total: '),
                                              Text(
                                                ' 32mb',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Icon(Icons.cloud_upload_rounded),
                                              Text('Percent: '),
                                              Text(
                                                '82%',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text('FREE CPU:'),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              // Icon(Icons.memory_rounded),
                                              Text('Total: '),
                                              Text(
                                                ' 32mb',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Icon(Icons.cloud_upload_rounded),
                                              Text('Percent: '),
                                              Text(
                                                '82%',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text('FREE RAM:'),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            /* mainAxisAlignment:
                                                MainAxisAlignment.end, */
                                            children: [
                                              Text('Total: '),
                                              Text(
                                                ' 123mb ',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // Icon(Icons.memory_rounded),
                                            ],
                                          ),
                                          Row(
                                            /* mainAxisAlignment:
                                                MainAxisAlignment.end, */
                                            children: [
                                              Text('Percent: '),
                                              Text(
                                                ' 12% ',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // Icon(Icons.cloud_upload_rounded),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
