import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';

import 'audio_call_page.dart';

class VideoCallPage extends StatelessWidget {
  final UserModel userModel;
  final UserModel targetUser;

  const VideoCallPage({super.key, required this.targetUser, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Row(
          children: [
            Text(targetUser.name.toString(), style: kTitleStyle),
            gaph,
            Text("(1:05:28)", style: kTextStyle),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                  image: NetworkImage(targetUser.pic.toString()),
                  fit: BoxFit.cover)),
          Positioned(
              top: 30,
              right: 10,
              child: SizedBox(
                  height: 150.h,
                  width: 110.w,
                  child: Image(
                      image: NetworkImage(userModel.pic.toString()), fit: BoxFit.cover)))
        ],
      )),
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
                color: "enabled",
                pressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              AudioCallPage(userModel: userModel,targetUser: targetUser))));
                },
              ),
              const CallOption(icon: CupertinoIcons.speaker_2, color: "disabled"),
              const CallOption(icon: Icons.mic, color: "enabled"),
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
