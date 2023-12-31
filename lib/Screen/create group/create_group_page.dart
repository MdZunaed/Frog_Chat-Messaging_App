import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

import '../../widget/create_group_element.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

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
            const GroupSearchField(text: "Search people"),
            gap,
            Row(children: [
              Text("Suggestion", style: kTitleStyle),
              gaph,
              Icon(Icons.arrow_downward, color: kSecondayColor, size: 20.h)
            ]),
            gap,
            //Expanded(child: ChatList())
          ],
        ),
      )),
    );
  }
}
