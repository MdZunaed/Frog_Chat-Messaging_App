import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/VideoCall.dart';
import 'package:frog_chat/Screen/chat_inbox/audio_call.dart';
import 'package:frog_chat/style.dart';

import '../../elements/show_toast.dart';

class InboxAppbar extends StatelessWidget {
  String name;
  final imageUrl;

  InboxAppbar({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: NetworkImage(imageUrl),
        ),
        gaph,
        Expanded(
          flex: 2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 17.sp)),
                // SizedBox(height: 5.h),
                // Text("Active now",
                //     style: TextStyle(fontSize: 11.sp, color: kSecondayColor)),
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
  TextEditingController controller;
  VoidCallback onTap;
  InboxNavbar({super.key, required this.controller, required this.onTap});

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
        //Icon(Icons.location_on_rounded, color: kPrimaryColor, size: 30.r),
        IconButton(
            splashRadius: 25,
            icon: Icon(Icons.attach_file_rounded,
                color: kPrimaryColor, size: 30.r),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  height: 240.h,
                  decoration: const BoxDecoration(
                      color: kBgColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15).h,
                    child: Column(
                      children: [
                        Text("Share Content", style: kTitleStyle),
                        const SizedBox(height: 15),
                        SheetItem(
                            icon: Icons.camera_alt,
                            text: "Camera",
                            onTap: () {}),
                        const SizedBox(height: 15),
                        SheetItem(
                            icon: Icons.image,
                            text: "From Gallery",
                            onTap: () {}),
                        const SizedBox(height: 15),
                        SheetItem(
                            icon: Icons.file_copy,
                            text: "Send Documents",
                            onTap: () {}),
                      ],
                    ),
                  ),
                ),
              );
            }),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50.h,
            child: TextField(
              // expands: true,
              // minLines: null,
              maxLines: null,
              controller: widget.controller,
              style: kTitleStyle,
              decoration: InputDecoration(
                isDense: true,
                //suffixIcon: Icon(Icons.face_5_rounded, color: kPrimaryColor, size: 23.h),
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
            splashRadius: 28,
            icon: Icon(Icons.send, color: kPrimaryColor, size: 28.r),
            onPressed: widget.onTap),
      ]),
    );
  }
}

class SheetItem extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  SheetItem(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: onTap,
      onTap: () {
        toast().toastmessage("Not available right now");
      },
      child: Row(
        children: [
          Container(
              height: 45.h,
              width: 45.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kDarkColor),
              child: Icon(icon, color: kPrimaryColor)),
          gaph,
          Text(text, style: kHeadingStyle.copyWith(fontSize: 20.sp))
        ],
      ),
    );
  }
}
