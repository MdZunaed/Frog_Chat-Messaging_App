import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';

class OtpField extends StatelessWidget {
  const OtpField({this.otpController, super.key});
  final TextEditingController? otpController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 55.w,
      child: TextField(
        //autofocus: true,
        controller: otpController,
        cursorColor: kPrimaryColor,
        style: const TextStyle(color: kWhiteColor),
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: "*",
          hintStyle: const TextStyle(color: kSecondayColor),
          focusColor: kSecondayColor,
          filled: true,
          fillColor: kDarkColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.r),
              borderRadius: BorderRadius.circular(15.r)),
        ),
      ),
    );
  }
}
