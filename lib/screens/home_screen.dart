import 'package:flutter/material.dart';
import 'package:flutter_port_scanner/components/scanner/scanner_view.dart';
import 'package:flutter_port_scanner/notifiers/scanner_notifier.dart';
import 'package:flutter_port_scanner/notifiers/theme_notifier.dart';
import 'package:flutter_port_scanner/services/scanner_service.dart';
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
          title: Text("Scanner"),
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
            ? Container()
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
