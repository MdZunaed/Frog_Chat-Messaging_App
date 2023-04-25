import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import '../../../style.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: const Text("Account Information"),
      ),
      backgroundColor: kBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(children: [
          Center(
            child: Stack(children: [
              CircleAvatar(
                  radius: 60.r,
                  backgroundImage: const AssetImage("images/sayed.png")),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: const BoxDecoration(
                          color: kPrimaryColor, shape: BoxShape.circle),
                      child: PopupMenuButton(
                          icon: const Icon(Icons.edit_document,
                              color: kDarkColor),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: Text("Take Picture",
                                        style: kTitleStyle.copyWith(
                                            color: kDarkColor))),
                                PopupMenuItem(
                                    child: Text("From Gallery",
                                        style: kTitleStyle.copyWith(
                                            color: kDarkColor))),
                              ]))),
            ]),
          ),
          gap,
          InfoItem(fieldName: "Your Name", fieldInfo: "Abu Sayed"),
          InfoItem(
              fieldName: "Your email", fieldInfo: "arshansayed21@gmail.com"),
          InfoItem(fieldName: "Your Number", fieldInfo: "+8801720065881"),
          const Spacer(),
          Button(text: "Edit Information")
        ]),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  InfoItem({super.key, required this.fieldName, required this.fieldInfo});
  String fieldName;
  String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: kTitleStyle.copyWith(color: kSecondayColor, fontSize: 15.sp),
          ),
          SizedBox(height: 5.h),
          Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 7.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15).r,
                border: Border.all(color: kPrimaryColor, width: 1.3.w)),
            child: Row(
              children: [
                Text(fieldInfo, style: kTitleStyle.copyWith(fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
