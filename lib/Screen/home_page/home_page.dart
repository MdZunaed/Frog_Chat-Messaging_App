import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';
import 'chat_list.dart';
import 'group_list.dart';
import 'homepage_element.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: Text("Frog Chat", style: kHeadingStyle),
        centerTitle: true,
        leading: BarIcon(icon: Icons.search),
        actions: [BarImage(imageName: "sayed.png")],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        child: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10.h),
            //   height: 80.h,
            //   child: ListView(
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       ActiveNow(name: "Abu Sayed", imgName: "sayed.png"),
            //       ActiveNow(name: "Md Zunaed", imgName: "zunu.jpg"),
            //       ActiveNow(name: "Md Mizan", imgName: "mizan.jpg"),
            //       ActiveNow(name: "Alif Sarkar", imgName: "alif.jpg"),
            //       ActiveNow(name: "Mahmudul", imgName: "buira.jpg"),
            //       ActiveNow(name: "Md Zunaed", imgName: "zunu.jpg"),
            //       ActiveNow(name: "Md Mizan", imgName: "mizan.jpg"),
            //       ActiveNow(name: "Mahmudul", imgName: "buira.jpg"),
            //     ],
            //   ),
            // ),
            TabBar(
                controller: tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.white70,
                labelColor: kDarkColor,
                labelStyle: TextStyle(
                    fontSize: 18.sp,
                    color: kDarkColor,
                    fontWeight: FontWeight.w600),
                indicator: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(11).r),
                tabs: [
                  SizedBox(
                      height: 40.h,
                      width: 140.w,
                      child: const Tab(text: "Chat's")),
                  SizedBox(
                      height: 40.h,
                      width: 140.w,
                      child: const Tab(text: "Group's")),
                ]),
            SizedBox(height: 15.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  ChatList(),
                  GroupList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
