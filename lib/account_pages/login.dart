import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void logIn() async {
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (userCredential != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        Fluttertoast.showToast(
            msg: "Login successfully",
            textColor: kDarkColor,
            backgroundColor: kPrimaryColor);
      }
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message!,
          textColor: kDarkColor,
          backgroundColor: kPrimaryColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                InputField(controller: emailController, text: "Email"),
                gap,
                PasswordField(controller: passController, hintText: "Password"),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        child: Text("Forgot Password?", style: kTitleStyle),
                        onPressed: () => Fluttertoast.showToast(
                            msg: "Not available right now",
                            textColor: kDarkColor,
                            backgroundColor: kPrimaryColor,
                            gravity: ToastGravity.BOTTOM)),
                  ],
                ),
                SizedBox(height: 8.h),

                //gap,
                InkWell(
                  child: Button(text: "Log in"),
                  onTap: () {
                    logIn();
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                ),
                gap,
                Text("Don't you have an Account?", style: kTitleStyle),
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
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
      ),
    );
  }
}
