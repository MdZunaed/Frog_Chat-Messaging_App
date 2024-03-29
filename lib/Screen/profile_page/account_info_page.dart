import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/widget/button.dart';
import 'package:frog_chat/widget/show_toast.dart';
import '../../models/UserModel.dart';
import '../../style.dart';

class AccountInfoPage extends StatelessWidget {
  final UserModel userModel;

  const AccountInfoPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Information")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(children: [
          CircleAvatar(radius: 55.r, backgroundImage: NetworkImage(userModel.pic.toString())),
          gap,
          gap,
          InfoItem(fieldName: "Your name", fieldInfo: userModel.name.toString()),
          InfoItem(fieldName: "Your email", fieldInfo: userModel.email.toString()),
          //const InfoItem(fieldName: "Your Number", fieldInfo: ""),
          const Spacer(),
          Button(
            text: "Edit Information",
            onTap: () {
              toast().toastmessage("Not available");
            },
          )
        ]),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.fieldName, required this.fieldInfo});

  final String fieldName;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
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
