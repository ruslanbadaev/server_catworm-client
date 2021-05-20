class Scanner {
  String ip;
  int timeout;
  List<int> ports;
  Scanner();
  Scanner.fromMap(Map<String, dynamic> data) {
    ip = data['ip'];
    timeout = data['timeout'];
    ports = data['ports'];
  }

  Map<String, dynamic> toMap() {
    return {
      'ip': ip,
      'timeout': timeout,
      'ports': ports,
    };
  }
}
