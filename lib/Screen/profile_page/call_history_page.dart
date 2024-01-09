import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: kBgColor, title: const Text("Call History")),
      backgroundColor: kBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            GetHistory(
              icon: "Dialed",
              imageName: "zunu.jpg",
              title: "Md Zunaed",
              time: "2:14 pm, 9 Feb, 33.18 min",
            ),
            GetHistory(
              icon: "Recieve",
              imageName: "alif.jpg",
              title: "Alif Sarkar",
              time: "3:20 pm, 23 jan, 8.47 min",
            ),
            GetHistory(
              icon: "missed",
              imageName: "mizan.jpg",
              title: "Mizan Hossen",
              time: "4:35 pm, 8 jan, 10.02 min",
            ),
          ],
        ),
      ),
    );
  }
}

class GetHistory extends StatelessWidget {
  final String imageName;
  final String title;
  final String time;
  final String icon;

  const GetHistory({
    super.key,
    required this.imageName,
    required this.title,
    required this.time,
    this.icon = "Dialed",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: kDarkColor),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        //tileColor: kDarkColor,
        leading: CircleAvatar(
            radius: 25.r, backgroundImage: AssetImage("images/$imageName")),
        title: Text(title, style: kTitleStyle.copyWith(fontSize: 20)),
        subtitle: Text(time, style: kTextStyle.copyWith(color: kSecondayColor)),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: icon == "Dialed"
              ? const Icon(
                  Icons.call_made_rounded,
                  color: kPrimaryColor,
                )
              : icon == "Recieve"
                  ? const Icon(
                      Icons.call_received_rounded,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Icons.call_made_rounded,
                      color: Colors.red,
                    ),
        ),
      ),
    );
  }
}
