class InboxModel {
  InboxModel({this.inboxId, this.persons, this.lastMessage});
  String? inboxId;
  Map<String, dynamic>? persons;
  String? lastMessage;

  InboxModel.fromMap(Map<String, dynamic> map) {
    inboxId = map["inboxid"];
    persons = map["persons"];
    lastMessage = map["lastmessage"];
  }

  Map<String, dynamic> toMap() {
    return {
      "inboxid": inboxId,
      "persons": persons,
      "lastmessage": lastMessage,
    };
  }
}
