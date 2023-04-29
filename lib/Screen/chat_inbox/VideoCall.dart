import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/style.dart';

import 'audio_call.dart';
import 'chat_inbox.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Row(
          children: [
            Text("Abu Sayed", style: kTitleStyle),
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
              child: const Image(
                  image: AssetImage("images/sayedb.png"), fit: BoxFit.cover)),
          const Positioned(
              top: 30,
              right: 5,
              child: Image(image: AssetImage("images/mizanb.png")))
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
                          builder: ((context) => const AudioCall())));
                },
              ),
              CallOption(icon: CupertinoIcons.speaker_2, color: "disabled"),
              CallOption(icon: Icons.mic, color: "enabled"),
              CallOption(
                icon: Icons.call,
                color: "end",
                pressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatInbox()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
