import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
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
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  void _onQRViewCreated(QRViewController controller) {
    controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData != null) print(scanData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scanner"),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 300),
                ),
              ),
              Align(
                widthFactor: 5,
                heightFactor: 3,
                child: Text('Scan QR code from your server'),
              ),
            ],
          ),
        ));
  }
}
