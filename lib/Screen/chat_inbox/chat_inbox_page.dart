import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/widget/inbox_element.dart';
import 'package:frog_chat/main.dart';
import 'package:frog_chat/models/InboxModel.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/models/messageModel.dart';
import 'package:frog_chat/style.dart';

class ChatInboxPage extends StatefulWidget {
  final UserModel userModel;
  final UserModel targetUser;
  final User firebaseUser;
  final InboxModel inbox;

  const ChatInboxPage(
      {super.key,
      required this.targetUser,
      required this.inbox,
      required this.firebaseUser,
      required this.userModel});

  @override
  State<ChatInboxPage> createState() => _ChatInboxPageState();
}

class _ChatInboxPageState extends State<ChatInboxPage> {
  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: InboxAppbar(userModel: widget.userModel, targetUser: widget.targetUser)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8).r,
        child: Column(children: [
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("inboxes")
                .doc(widget.inbox.inboxId)
                .collection("messages")
                .orderBy("createdOn", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;
                  return ListView.builder(
                    reverse: true,
                    itemCount: dataSnapshot.docs.length,
                    itemBuilder: (context, index) {
                      MessageModel currentMessage =
                          MessageModel.fromMap(dataSnapshot.docs[index].data() as Map<String, dynamic>);
                      return Row(
                        mainAxisAlignment: (currentMessage.sender == widget.targetUser.uid)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Container(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.7),
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (currentMessage.sender == widget.targetUser.uid)
                                      //? Colors.grey.shade400
                                      ? kDarkColor
                                      : kPrimaryColor),
                              child: Text(
                                currentMessage.text.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: (currentMessage.sender == widget.targetUser.uid)
                                        ? kWhiteColor
                                        : kDarkColor,
                                    //color: kDarkColor,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  const Center(
                    child: Text("Error! PLease check your internet."),
                  );
                } else {
                  Center(
                    child: Text("Say Hi to ${widget.targetUser.name}"),
                  );
                }
              } else {
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          )),
          InboxNavbar(controller: msgController, onTap: () => sendMsg()),
        ]),
      ),
      // bottomNavigationBar:  InboxNavbar(
      //   controller: msgController,
      //   onTap: () => sendMsg()),
    );
  }

  void sendMsg() async {
    String msg = msgController.text.trim();
    msgController.clear();
    if (msg != null && msg != "") {
      MessageModel newMessage = MessageModel(
        messageId: uuid.v1(),
        sender: widget.userModel.uid,
        creratedOn: DateTime.now().toString(),
        text: msg,
        seen: false,
      );
      FirebaseFirestore.instance
          .collection("inboxes")
          .doc(widget.inbox.inboxId)
          .collection("messages")
          .doc(newMessage.messageId)
          .set(newMessage.toMap());
      widget.inbox.lastMessage = msg;
      FirebaseFirestore.instance.collection("inboxes").doc(widget.inbox.inboxId).set(widget.inbox.toMap());
    }
  }
}
