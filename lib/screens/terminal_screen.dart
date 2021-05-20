import 'package:flutter/material.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:provider/provider.dart';

class TerminalScreen extends StatefulWidget {
  @override
  State createState() {
    return TerminalScreenSate();
  }
}

class TerminalScreenSate extends State<TerminalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scanner"),
        ),
        body: Container());
  }
}
