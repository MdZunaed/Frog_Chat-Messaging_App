import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/VideoCall.dart';
import 'package:frog_chat/Screen/chat_inbox/audio_call.dart';
import 'package:frog_chat/Screen/chat_inbox/person_info.dart';
import 'package:frog_chat/Screen/profile_page/option_page/account_info.dart';
import 'package:frog_chat/style.dart';

class InboxAppbar extends StatelessWidget {
  const InboxAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: const AssetImage("images/sayed.png"),
        ),
        gaph,
        Expanded(
          flex: 2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Abu Sayed", style: TextStyle(fontSize: 17.sp)),
                SizedBox(height: 5.h),
                Text("Active now",
                    style: TextStyle(fontSize: 11.sp, color: kSecondayColor)),
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            gaph,
            InkWell(
              child: const Icon(Icons.call, color: kPrimaryColor),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AudioCall()));
              },
            ),
            SizedBox(width: 15.w),
            InkWell(
              child: const Icon(CupertinoIcons.video_camera_solid,
                  size: 30, color: kPrimaryColor),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const VideoCall()));
              },
            ),
            SizedBox(width: 15.w),
            InkWell(
              child: const Icon(Icons.info_rounded, color: kPrimaryColor),
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        backgroundColor: kDarkColor,
                        title: Text("Darao Mia",
                            style: kTitleStyle.copyWith(fontSize: 24.sp)),
                        content: Text("Ei page figma te pai nai, tai kori nai",
                            style: kTextStyle),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Ok Dekhtasi"))
                        ],
                      )),
            ),
          ],
        ),
      ],
    );
  }
}

class InboxNavbar extends StatefulWidget {
  const InboxNavbar({super.key});

  @override
  State<InboxNavbar> createState() => _InboxNavbarState();
}

class _InboxNavbarState extends State<InboxNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.all(10.r),
      child: Row(children: [
        Icon(Icons.location_on_rounded, color: kPrimaryColor, size: 30.r),
        IconButton(
            icon: Icon(Icons.attach_file_rounded,
                color: kPrimaryColor, size: 30.r),
            onPressed: () {}),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50.h,
            child: TextField(
              // expands: true,
              // minLines: null,
              // maxLines: null,
              style: kTitleStyle,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: Icon(Icons.face_5_rounded,
                    color: kPrimaryColor, size: 23.h),
                hintText: "Type here...",
                hintStyle: const TextStyle(color: kSecondayColor, fontSize: 15),
                fillColor: kDarkColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.send, color: kPrimaryColor, size: 30.r),
            onPressed: () {}),
      ]),
    );
  }
}
