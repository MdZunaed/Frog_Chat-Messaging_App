import 'package:flutter/material.dart';
import 'package:frog_chat/style.dart';

import '../../models/UserModel.dart';

class PersonInfoPage extends StatelessWidget {
  final UserModel targetUser;

  const PersonInfoPage({super.key, required this.targetUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kBgColor, actions: [
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: kWhiteColor),
            color: kPrimaryColor,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Row(children: [
                  const Icon(Icons.block, color: kDarkColor),
                  gaph,
                  Text("Block user",
                      style: kTitleStyle.copyWith(color: kDarkColor))
                ]))
              ];
            })
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              gap,
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(targetUser.pic.toString())),
              gap,
              Text(
                targetUser.name.toString(),
                style: kHeadingStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
