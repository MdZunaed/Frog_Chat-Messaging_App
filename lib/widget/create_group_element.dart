import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style.dart';

class GroupSearchField extends StatelessWidget {
  const GroupSearchField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextField(
        cursorColor: kPrimaryColor,
        style: const TextStyle(color: kWhiteColor),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_rounded, color: kSecondayColor),
          suffixIcon: IconButton(
              icon: const Icon(Icons.search, color: kSecondayColor),
              onPressed: () {}),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: kSecondayColor),
              borderRadius: BorderRadius.circular(15).r),
          hintText: text,
          hintStyle: const TextStyle(color: kSecondayColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: const BorderSide(color: kSecondayColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(15).r),
        ),
      ),
    );
  }
}
