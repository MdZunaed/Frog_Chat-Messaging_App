import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {required this.controller, required this.hintText, super.key});
  final String hintText;
  final TextEditingController controller;

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
          controller: widget.controller,
          obscureText: isObscure,
          cursorColor: kPrimaryColor,
          style: const TextStyle(color: kWhiteColor),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.asterisk_circle, size: 25.h),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? kPrimaryColor
                      : kSecondayColor),
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
