class MessageModel {
  MessageModel({this.sender, this.text, this.creratedOn, this.seen});

  String? sender;
  String? text;
  String? creratedOn;
  bool? seen;

  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
    creratedOn = map["createdOn"].toDate();
    seen = map["seen"];
  }

  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "text": text,
      "createdOn": creratedOn,
      "seen": seen,
    };
  }
}
