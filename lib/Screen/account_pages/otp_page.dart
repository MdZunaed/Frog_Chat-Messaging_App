import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';
import 'package:frog_chat/widget/button.dart';
import 'package:frog_chat/widget/otp_field.dart';

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
                  const OtpField(),
                  gaph,
                  const OtpField(),
                  gaph,
                  const OtpField(),
                  gaph,
                  const OtpField(),
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
              Button(
                  text: "Ok Done",
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SuccessPage()));},),
                  })
            ],
          ),
        ),
      ),
    );
  }
}
