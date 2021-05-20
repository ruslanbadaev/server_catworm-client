import 'package:flutter/material.dart';
import 'package:flutter_port_scanner/models/scanner.dart';
import 'package:flutter_port_scanner/notifiers/scanner_notifier.dart';
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
