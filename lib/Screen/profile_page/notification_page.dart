import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBgColor, title: const Text("Notification & Sound")),
      //backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25).r,
        child: Column(
          children: [
            const NotificationItemName(text: "Notification"),
            gap,
            Row(children: [
              Text("Message", style: kTextStyle.copyWith(color: kPrimaryColor))
            ]),
            const NotificationItemName(text: "Chat"),
            const NotificationItemName(text: "Group's"),
            gap,
            Row(children: [
              Text("Call's", style: kTextStyle.copyWith(color: kPrimaryColor))
            ]),
            const NotificationItemName(text: "Ringtone"),
            const NotificationItemName(text: "Vibrate"),
          ],
        ),
      ),
    );
  }
}

class NotificationItemName extends StatefulWidget {
  const NotificationItemName({super.key, required this.text, this.val});
  final String text;
  final bool? val;

  @override
  State<NotificationItemName> createState() => _NotificationItemNameState();
}

class _NotificationItemNameState extends State<NotificationItemName> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text, style: kTextStyle.copyWith(fontSize: 16.sp)),
        Switch(
          value: val,
          onChanged: (value) {
            setState(() {
              val = value;
            });
          },
          activeColor: kPrimaryColor,
          activeTrackColor: kDarkColor,
          inactiveThumbColor: kSecondayColor,
          inactiveTrackColor: kDarkColor,
        )
      ],
    );
  }
}