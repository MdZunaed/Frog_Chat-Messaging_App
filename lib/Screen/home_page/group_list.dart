import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/create%20group/create_group.dart';
import 'package:frog_chat/style.dart';

class GroupList extends StatelessWidget {
  GroupList({super.key});

  List group = [
    "Frog Chat Community",
    "Skill Inventor",
    "Project Little jinious",
    "We are মাল",
  ];
  List msg = [
    "Sobai mara kha",
    "Tk lagbo mia",
    "kobe dhorba project",
    "Chol tour e jai",
  ];

  List image = [
    "images/frog.png",
    "images/sk.png",
    "images/little.png",
    "images/mal.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: group.length,
        itemBuilder: (context, index) {
          return Container(
            height: 60.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(image[index]))),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(group[index],
                        style: kTitleStyle.copyWith(fontSize: 16)),
                    SizedBox(height: 4.h),
                    Text("Zunu: ${msg[index]}",
                        style: kTitleStyle.copyWith(color: kSecondayColor)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateGroup()));
        },
        icon: const Icon(
          Icons.add,
          color: kDarkColor,
        ),
        label: const Text(
          "Create Group",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w800, color: kDarkColor),
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
