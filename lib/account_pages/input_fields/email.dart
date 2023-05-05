import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

class InputField extends StatelessWidget {
  InputField({this.controller, required this.text, super.key});
  String text;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: kDarkColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          cursorColor: kPrimaryColor,
          style: const TextStyle(color: kWhiteColor),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.person_crop_circle, size: 25.h),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? kPrimaryColor
                    : kSecondayColor),
            border: InputBorder.none,
            hintText: text,
            hintStyle: const TextStyle(color: kSecondayColor),
            focusColor: kSecondayColor,
            fillColor: kSecondayColor,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
      ),
    );
  }
}
