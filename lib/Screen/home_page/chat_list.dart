import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/chat_inbox.dart';
import 'package:frog_chat/Screen/search_page/search_page.dart';
import 'package:frog_chat/style.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  List person = [
    "Alif Sarkar",
    "Mahmudul Hasan",
    "Md Mizan hossen",
    "Abu Sayed",
    "Md Zunaed",
    "Alamin Hossen",
    "Mahmudul Hasan",
    "Md Mizan",
    "Abu Sayed",
    "Md Zunaed",
    "Alamin Hossen",
    "Mahmudul Hasan",
    "Alif Sarkar",
  ];
  List msg = [
    "ki khbr",
    "kmn aso",
    "group e aho",
    "movie ta dao",
    "khida lagse",
    "ki khbr",
    "kmn aso",
    "group e aho",
    "movie ta dao",
    "khida lagse",
    "ki khbr",
    "kmn aso",
    "ki khbr",
  ];

  List image = [
    "images/alif.jpg",
    "images/buira.jpg",
    "images/mizan.jpg",
    "images/sayed.png",
    "images/zunu.jpg",
    "images/alamin.jpg",
    "images/buira.jpg",
    "images/mizan.jpg",
    "images/sayed.png",
    "images/zunu.jpg",
    "images/alamin.jpg",
    "images/buira.jpg",
    "images/alif.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.person_add, color: kDarkColor),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: person.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => const ChatInbox())));
            },
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                  //color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10.r)),
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
                        image: DecorationImage(
                            image: AssetImage(image[index]),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(person[index],
                          style: kTitleStyle.copyWith(fontSize: 16)),
                      SizedBox(height: 4.h),
                      Text(msg[index],
                          style: kTitleStyle.copyWith(color: kSecondayColor)),
                    ],
                  ),
                  const Spacer(),
                  const Text("Active"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
