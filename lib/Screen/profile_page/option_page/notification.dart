import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBgColor, title: const Text("Notification & Sound")),
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25).r,
        child: Column(
          children: [
            ItemName(text: "Notification"),
            gap,
            Row(children: [
              Text("Message", style: kTextStyle.copyWith(color: kPrimaryColor))
            ]),
            ItemName(text: "Chat"),
            ItemName(text: "Group's"),
            gap,
            Row(children: [
              Text("Call's", style: kTextStyle.copyWith(color: kPrimaryColor))
            ]),
            ItemName(text: "Ringtone"),
            ItemName(text: "Vibrate"),
          ],
        ),
      ),
    );
  }
}

class ItemName extends StatefulWidget {
  ItemName({super.key, required this.text, this.val});
  String text;
  bool? val;

  @override
  State<ItemName> createState() => _ItemNameState();
}

class _ItemNameState extends State<ItemName> {
  late bool val = true;
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

class OnOff extends StatefulWidget {
  OnOff({super.key, this.val});
  bool? val;

  @override
  State<OnOff> createState() => _OnOffState();
}

class _OnOffState extends State<OnOff> {
  late bool val = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
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
    );
  }
}
