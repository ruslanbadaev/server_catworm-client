class ServerCard {
  String name;
  String ip;
  int currDisk;
  int totalDisk;
  int currCPU;
  int totalCPU;
  int currRAM;
  int totalRAM;
  ServerCard();
  ServerCard.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    ip = data['ip'];
    currDisk = data['currDisk'];
    totalDisk = data['totalDisk'];
    currCPU = data['currCPU'];
    totalCPU = data['totalCPU'];
    currRAM = data['currRAM'];
    totalRAM = data['totalRAM'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ip': ip,
      'currDisk': currDisk,
      'totalDisk': totalDisk,
      'currCPU': currCPU,
      'totalCPU': totalCPU,
      'currRAM': currRAM,
      'totalRAM': totalRAM,
    };
  }
}
