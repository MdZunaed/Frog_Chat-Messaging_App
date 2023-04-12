import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

class Button extends StatelessWidget {
  Button({required this.text, super.key});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30.r)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: kDarkColor, fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
      ),
    );
  }
}

class MiniButton extends StatelessWidget {
  MiniButton({required this.text, super.key});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: kPrimaryColor),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: kDarkColor, fontWeight: FontWeight.w600, fontSize: 17.sp),
      )),
    );
  }
}
