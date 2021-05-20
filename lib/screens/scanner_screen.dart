import 'package:flutter/material.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:provider/provider.dart';

class ScannerScreen extends StatefulWidget {
  @override
  State createState() {
    return ScannerScreenSate();
  }
}

class ScannerScreenSate extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scanner"),
        ),
        body: Container());
  }
}
