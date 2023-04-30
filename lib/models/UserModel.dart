import 'dart:io';

class UserModel {
  UserModel({this.uid, this.name, this.email, this.pic});
  String? uid;
  String? name;
  String? email;
  String? pic;

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    name = map["name"];
    email = map["email"];
    pic = map["pic"];
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "pic": pic,
    };
  }
}
