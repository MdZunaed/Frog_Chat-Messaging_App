class InboxModel {
  InboxModel(
      {this.inboxId,
      this.persons,
      this.lastMessage,
      this.users,
      this.chatTime});
  String? inboxId;
  Map<String, dynamic>? persons;
  String? lastMessage;
  List<dynamic>? users;
  DateTime? chatTime;

  InboxModel.fromMap(Map<String, dynamic> map) {
    inboxId = map["inboxid"];
    persons = map["persons"];
    lastMessage = map["lastmessage"];
    users = map["users"];
    chatTime = map["chatTime"].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      "inboxid": inboxId,
      "persons": persons,
      "lastmessage": lastMessage,
      "users": users,
      "chatTime": chatTime,
    };
  }
}
