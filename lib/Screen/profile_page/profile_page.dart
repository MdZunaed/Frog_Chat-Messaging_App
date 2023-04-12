import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/profile_page/option_page/account_info.dart';
import 'package:frog_chat/Screen/profile_page/option_page/call_history.dart';
import 'package:frog_chat/Screen/profile_page/option_page/notification.dart';
import 'package:frog_chat/Screen/profile_page/profile_option.dart';
import 'package:frog_chat/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(backgroundColor: kBgColor, elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("images/sayed.png"),
            ),
            gap,
            Text("Abu Sayed", style: kHeadingStyle),
            gap,
            Divider(color: kPrimaryColor, thickness: 2.h),
            gap,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AccountInfo())));
              },
              child: ProfileOption(
                  icon: Icons.person_rounded,
                  optionName: "Account Information"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const NotificationPage())));
              },
              child: ProfileOption(
                  icon: Icons.notifications,
                  optionName: "Notification & Sound"),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CallHistory())));
                },
                child: ProfileOption(
                    icon: Icons.call, optionName: "Call History")),
          ]),
        ),
      )),
    );
  }
}
