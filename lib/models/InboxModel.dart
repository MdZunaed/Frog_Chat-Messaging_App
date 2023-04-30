class InboxModel {
  InboxModel({this.inboxId, this.persons});
  String? inboxId;
  List<String>? persons;

  InboxModel.fromMap(Map<String, dynamic> map) {
    inboxId = map["inboxId"];
    persons = map["persons"];
  }

  Map<String, dynamic> toMap() {
    return {
      "inboxId": inboxId,
      "persons": persons,
    };
  }
}
