class MessageModel {
  MessageModel(
      {this.messageId, this.sender, this.text, this.creratedOn, this.seen});
  String? messageId;
  String? sender;
  String? text;
  String? creratedOn;
  bool? seen;

  MessageModel.fromMap(Map<String, dynamic> map) {
    messageId = map["messageId"];
    sender = map["sender"];
    text = map["text"];
    creratedOn = map["createdOn"];
    seen = map["seen"];
  }

  Map<String, dynamic> toMap() {
    return {
      "messageId": messageId,
      "sender": sender,
      "text": text,
      "createdOn": creratedOn,
      "seen": seen,
    };
  }
}
