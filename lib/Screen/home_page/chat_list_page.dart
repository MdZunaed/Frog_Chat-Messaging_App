import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/chat_inbox_page.dart';
import 'package:frog_chat/Screen/search_page/search_page.dart';
import 'package:frog_chat/models/InboxModel.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/models/firebase_helper.dart';
import 'package:frog_chat/style.dart';

class ChatListPage extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const ChatListPage(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchPage(
                      userModel: userModel, firebaseUser: firebaseUser)));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.person_add, color: kDarkColor),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("inboxes")
            .where("users", arrayContains: userModel.uid)
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
                  personKeys.remove(userModel.uid);
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
                                      builder: ((context) => ChatInboxPage(
                                            userModel: userModel,
                                            firebaseUser: firebaseUser,
                                            inbox: inboxModel,
                                            targetUser: targetUser,
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
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(targetUser.name.toString(),
                                            style: kTitleStyle),
                                        SizedBox(height: 4.h),
                                        (inboxModel.lastMessage != "")
                                            ? Text(
                                                inboxModel.lastMessage
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: kTitleStyle.copyWith(
                                                  color: kSecondayColor,
                                                ))
                                            : Text(
                                                "Say hello to ${targetUser.name} !",
                                                style: kTextStyle.copyWith(
                                                    color: kWhiteColor)),
                                      ],
                                    ),
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
