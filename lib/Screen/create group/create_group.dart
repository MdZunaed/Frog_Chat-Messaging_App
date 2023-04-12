import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/home_page/chat_list.dart';
import 'package:frog_chat/style.dart';

import 'group_element.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Add People", style: kHeadingStyle),
              ],
            ),
            gap,
            SearchField(text: "Search people"),
            gap,
            Row(children: [
              Text("Suggetion", style: kTitleStyle),
              gaph,
              Icon(Icons.arrow_downward, color: kSecondayColor, size: 20.h)
            ]),
            gap,
            Expanded(child: ChatList())
          ],
        ),
      )),
    );
  }
}
