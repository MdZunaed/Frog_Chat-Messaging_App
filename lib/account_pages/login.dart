import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/input_fields/password.dart';
import 'package:frog_chat/account_pages/sign_up.dart';
import 'package:frog_chat/style.dart';
import '../Screen/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Image(image: AssetImage("images/frog hand.png")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Login to Frog Chat", style: kHeadingStyle),
                ],
              ),
              gap,
              gap,
              InputField(text: "Email"),
              gap,
              PasswordField(hintText: "Password"),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: kTitleStyle),
                ],
              ),
              gap,
              InkWell(
                child: Button(text: "Log in"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              gap,
              Text("Don't you have an Account?", style: kTitleStyle),
              gap,
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MiniButton(text: "Sign up"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
