import 'package:flutter/material.dart';
import 'package:flutter_port_scanner/components/scanner/scanner_view_model.dart';
import 'package:flutter_port_scanner/models/scanner.dart';

class ScannerView extends StatefulWidget {
  final Scanner scanner;

  ScannerView({@required this.scanner});

  @override
  State createState() {
    return ScannerViewState(scanner);
  }
}

class ScannerViewState extends State<ScannerView> {
  Scanner scanner;
  ScannerViewModel scannerViewModel;

  ScannerViewState(this.scanner) {
    scannerViewModel = new ScannerViewModel();
    scannerViewModel.setScanner(scanner);
  }

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
