import 'package:server_catworm/models/scanner.dart';

class ScannerViewModel {
  Scanner _scanner;

  setScanner(Scanner scanner) {
    _scanner = scanner;
  }

  Scanner get scanner => _scanner;
}
