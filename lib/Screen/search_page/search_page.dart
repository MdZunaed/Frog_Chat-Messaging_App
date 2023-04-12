import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/home_page/homepage_element.dart';
import 'package:frog_chat/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
          backgroundColor: kBgColor,
          title: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here",
              hintStyle: kTitleStyle.copyWith(color: kSecondayColor),
            ),
            style: kTitleStyle,
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20).r,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent searches",
                  style: kTitleStyle.copyWith(color: kSecondayColor)),
              Text("Edit", style: kTitleStyle.copyWith(color: kPrimaryColor))
            ],
          ),
          gap,
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              children: [
                ActiveNow(imgName: "sayed.png", name: "Abu Sayed"),
                ActiveNow(imgName: "zunu.jpg", name: "Md Zunaed"),
                ActiveNow(imgName: "mizan.jpg", name: "Mizan Hossen"),
                ActiveNow(imgName: "buira.jpg", name: "Mahmudul"),
                ActiveNow(imgName: "alamin.jpg", name: "Alamin hossen"),
                ActiveNow(imgName: "alif.jpg", name: "Alif Sarkar"),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
