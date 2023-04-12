import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/inbox_element.dart';
import 'package:frog_chat/style.dart';

class ChatInbox extends StatefulWidget {
  const ChatInbox({super.key});

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: const InboxAppbar(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
        child: Stack(children: [
          Container(
              alignment: Alignment.bottomCenter, child: const InboxNavbar()),
        ]),
      )),
      //bottomNavigationBar: const InboxNavbar(),
    );
  }
}
