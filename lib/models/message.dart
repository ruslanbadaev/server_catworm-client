class Message {
  int id;
  String message;
  String date;
  String type;
  String ip;
  Message();
  Message.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    message = data['message'];
    date = data['date'];
    type = data['type'];
    ip = data['ip'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'date': date,
      'type': type,
      'ip': ip,
    };
  }
}
