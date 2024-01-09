import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/video_call_page.dart';
import 'package:frog_chat/Screen/chat_inbox/audio_call_page.dart';
import 'package:frog_chat/Screen/chat_inbox/person_info_page.dart';
import 'package:frog_chat/style.dart';
import 'package:frog_chat/widget/show_toast.dart';
import '../models/UserModel.dart';

class InboxAppbar extends StatelessWidget {
  final UserModel userModel;
  final UserModel targetUser;

  const InboxAppbar({super.key, required this.targetUser, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: NetworkImage(targetUser.pic.toString()),
        ),
        gaph,
        Expanded(
          flex: 2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(targetUser.name.toString(),
                    style: TextStyle(fontSize: 17.sp)),
                // SizedBox(height: 5.h),
                // Text("Active now",
                //     style: TextStyle(fontSize: 11.sp, color: kSecondayColor)),
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            gaph,
            InkWell(borderRadius: BorderRadius.circular(20),
              child: const Icon(Icons.call, color: kPrimaryColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AudioCallPage(userModel: userModel,targetUser: targetUser)));
              },
            ),
            SizedBox(width: 15.w),
            InkWell(borderRadius: BorderRadius.circular(20),
              child: const Icon(CupertinoIcons.video_camera_solid,
                  size: 30, color: kPrimaryColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VideoCallPage(userModel: userModel,targetUser: targetUser)));
              },
            ),
            SizedBox(width: 15.w),
            InkWell(
              borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.info_rounded, color: kPrimaryColor),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PersonInfoPage(targetUser: targetUser)));
                }),
          ],
        ),
      ],
    );
  }
}

class InboxNavbar extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onTapSend;

  const InboxNavbar({super.key, required this.controller, required this.onTapSend});

  @override
  State<InboxNavbar> createState() => _InboxNavbarState();
}

class _InboxNavbarState extends State<InboxNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70.h,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(children: [
        //Icon(Icons.location_on_rounded, color: kPrimaryColor, size: 30.r),
        IconButton(
            //splashRadius: 25,
            icon: Icon(Icons.attach_file_rounded,
                color: kPrimaryColor, size: 30.r),
            onPressed: () {
              sendAttachmentSheet(context);
            }),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5).w,
            //height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              style: kTitleStyle,
              //textInputAction: TextInputAction.done,
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
            //splashRadius: 28,
            icon: Icon(Icons.send, color: kPrimaryColor, size: 28.r),
            onPressed: widget.onTapSend),
      ]),
    );
  }

  Future<dynamic> sendAttachmentSheet(BuildContext context) {
    return showModalBottomSheet(
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
  }
}

class SheetItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SheetItem(
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
