import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import '../Screen/home_page/home_page.dart';

class SuccessPage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const SuccessPage(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30).w,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("images/frog.png"),
            gap,
            RichText(
              text: TextSpan(
                  text: "Frog Chat - ",
                  style: kHeadingStyle.copyWith(color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: "Congratulation, your account has been created",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white))
                  ]),
            ),
            SizedBox(height: 150.h),
            InkWell(
              child: Button(text: "Go to Home Page"),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            userModel: widget.userModel,
                            firebaseUser: widget.firebaseUser)));
              },
            )
          ]),
        ),
      ),
    );
  }
}
