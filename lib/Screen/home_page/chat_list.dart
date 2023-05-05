import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/chat_inbox.dart';
import 'package:frog_chat/Screen/search_page/search_page.dart';
import 'package:frog_chat/models/InboxModel.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/models/firebase_helper.dart';
import 'package:frog_chat/style.dart';

class ChatList extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const ChatList(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List person = [
    "Alif Sarkar",
    "Mahmudul Hasan",
    "Md Mizan hossen",
    "Abu Sayed",
    "Md Zunaed",
    "Alamin Hossen",
    "Mahmudul Hasan",
    "Md Mizan",
    "Abu Sayed",
    "Md Zunaed",
    "Alamin Hossen",
    "Mahmudul Hasan",
    "Alif Sarkar",
  ];

  List msg = [
    "ki khbr",
    "kmn aso",
    "group e aho",
    "movie ta dao",
    "khida lagse",
    "ki khbr",
    "kmn aso",
    "group e aho",
    "movie ta dao",
    "khida lagse",
    "ki khbr",
    "kmn aso",
    "ki khbr",
  ];

  List image = [
    "images/alif.jpg",
    "images/buira.jpg",
    "images/mizan.jpg",
    "images/sayed.png",
    "images/zunu.jpg",
    "images/alamin.jpg",
    "images/buira.jpg",
    "images/mizan.jpg",
    "images/sayed.png",
    "images/zunu.jpg",
    "images/alamin.jpg",
    "images/buira.jpg",
    "images/alif.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchPage(
                      userModel: widget.userModel,
                      firebaseUser: widget.firebaseUser)));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.person_add, color: kDarkColor),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("inboxes")
            .where("users", arrayContains: widget.userModel.uid)
            .orderBy("chatTime")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot inboxSnapShot = snapshot.data as QuerySnapshot;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: inboxSnapShot.docs.length,
                itemBuilder: (context, index) {
                  InboxModel inboxModel = InboxModel.fromMap(
                      inboxSnapShot.docs[index].data() as Map<String, dynamic>);

                  Map<String, dynamic> persons = inboxModel.persons!;
                  List<String> personKeys = persons.keys.toList();
                  personKeys.remove(widget.userModel.uid);
                  return FutureBuilder(
                    future: FirebaseHelper.userModelByUid(personKeys[0]),
                    builder: (context, userData) {
                      if (userData.connectionState == ConnectionState.done) {
                        if (userData.data != null) {
                          UserModel targetUser = userData.data as UserModel;
                          return InkWell(
                            borderRadius: BorderRadius.circular(15).r,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ChatInbox(
                                            userModel: widget.userModel,
                                            firebaseUser: widget.firebaseUser,
                                            inbox: inboxModel,
                                            targetuser: targetUser,
                                          ))));
                            },
                            child: Container(
                              height: 60.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              margin: EdgeInsets.symmetric(vertical: 3.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 52.h,
                                      width: 52.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  targetUser.pic.toString())))),
                                  gaph,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(targetUser.name.toString(),
                                          style: kTitleStyle.copyWith(
                                              fontSize: 16)),
                                      SizedBox(height: 4.h),
                                      (inboxModel.lastMessage != "")
                                          ? Text(
                                              inboxModel.lastMessage.toString(),
                                              style: kTitleStyle.copyWith(
                                                  color: kSecondayColor))
                                          : Text(
                                              "Say hello to ${targetUser.name} !",
                                              style: kTitleStyle.copyWith(
                                                  color: kWhiteColor)),
                                    ],
                                  ),
                                  // const Spacer(),
                                  // const Text("Active"),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: Text("No chats found"));
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
