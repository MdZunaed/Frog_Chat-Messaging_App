import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/otp_field.dart';
import 'package:frog_chat/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Text("Enter OTP", style: kHeadingStyle),
              ]),
              gap,
              gap,
              Row(children: [
                Text("We have sent you a verification code\nto your gmail",
                    style: kTitleStyle),
              ]),
              gap,
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpField(),
                  gaph,
                  OtpField(),
                  gaph,
                  OtpField(),
                  gaph,
                  OtpField(),
                ],
              ),
              gap,
              gap,
              Row(children: [
                Text(
                  "Resend in: 20 sec",
                  style: kTitleStyle,
                )
              ]),
              SizedBox(height: 250.h),
              InkWell(
                child: Button(text: "Ok Done"),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SuccessPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
