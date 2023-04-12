import 'package:flutter/material.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/otp_page.dart';
import 'package:frog_chat/style.dart';
import 'input_fields/password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Sign up - Frog Chat", style: kHeadingStyle)
                ]),
                gap,
                gap,
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Step-1", style: kTitleStyle, textAlign: TextAlign.start)
                ]),
                gap,
                InputField(text: "Enter your full name"),
                gap,
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Step-2", style: kTitleStyle, textAlign: TextAlign.start)
                ]),
                gap,
                InputField(text: "Your Email Address"),
                gap,
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("Step-3", style: kTitleStyle, textAlign: TextAlign.start)
                ]),
                gap,
                PasswordField(hintText: "Enter yout Password"),
                gap,
                PasswordField(hintText: "Confirm Password"),
                gap,
                gap,
                gap,
                InkWell(
                  child: Button(text: "Sign Up"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpPage()));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
