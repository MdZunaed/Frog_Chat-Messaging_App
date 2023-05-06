import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/VideoCall.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';

class AudioCall extends StatefulWidget {
  final UserModel targetUser;

  const AudioCall({super.key, required this.targetUser});

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(elevation: 0, backgroundColor: kBgColor),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(widget.targetUser.pic.toString()),
              ),
              gap,
              Text(widget.targetUser.name.toString(), style: kHeadingStyle),
              SizedBox(height: 8.h),
              Text("1:10:32", style: kTitleStyle)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 85,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: const BoxDecoration(
          color: kDarkColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CallOption(
                icon: Icons.video_call,
                color: "disabled",
                pressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              VideoCall(targetUser: widget.targetUser))));
                },
              ),
              CallOption(icon: CupertinoIcons.speaker_2, color: "disabled"),
              CallOption(icon: Icons.mic, color: "enabled"),
              CallOption(
                icon: Icons.call,
                color: "end",
                pressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallOption extends StatelessWidget {
  IconData icon;
  String color = "disabled";
  VoidCallback? pressed;

  CallOption(
      {super.key, required this.icon, required this.color, this.pressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: 55.h,
        width: 55.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color == "disabled"
                ? kSecondayColor
                : color == "enabled"
                    ? kPrimaryColor
                    : Colors.red),
        child: Center(
            child: Icon(
          icon,
          size: 30.h,
          color: kWhiteColor,
        )),
      ),
    );
  }
}
