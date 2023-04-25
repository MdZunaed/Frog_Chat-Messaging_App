import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';

class PasswordField extends StatefulWidget {
  PasswordField({required this.hintText, super.key});
  String hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

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
          obscureText: isObscure,
          cursorColor: kPrimaryColor,
          style: const TextStyle(color: kWhiteColor),
          decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.asterisk_circle,
                  size: 25.h, color: kSecondayColor),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: kSecondayColor),
              focusColor: kSecondayColor,
              fillColor: kSecondayColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 2.w),
                  borderRadius: BorderRadius.circular(30.r)),
              suffixIcon: IconButton(
                color: isObscure ? kSecondayColor : kPrimaryColor,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              )),
        ),
      ),
    );
  }
}