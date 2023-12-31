import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/account_pages/signup_page.dart';
import 'package:frog_chat/Screen/home_page/home_page.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import 'package:frog_chat/widget/button.dart';
import 'package:frog_chat/widget/email_field.dart';
import 'package:frog_chat/widget/password_field.dart';
import 'package:frog_chat/widget/show_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                        onPressed: () {
                          toast().toastmessage("Not available right now");
                        }),
                  ],
                ),
                SizedBox(height: 8.h),

                //gap,
                loading
                    ? const CircularProgressIndicator()
                    : Button(
                        text: "Log in",
                        onTap: () {
                          logIn();
                        },
                      ),
                gap,
                Text("Don't you have an Account?", style: kTitleStyle),
                gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MiniButton(
                      text: "Sign up",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logIn() async {
    loading = true;
    setState(() {});
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    UserCredential? userCredential;
    if (email == "" || pass == "") {
      toast().toastmessage("fill all the info");
      setState(() {
        loading = false;
      });
    } else {
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
        toast().toastmessage("Login successfully");
        loading = false;
        setState(() {});
      } on FirebaseAuthException catch (error) {
        toast().toastmessage(error.message!);
        setState(() {
          loading = false;
        });
      }
      if (userCredential != null) {
        String uid = userCredential.user!.uid;

        DocumentSnapshot userData =
            await FirebaseFirestore.instance.collection("users").doc(uid).get();
        UserModel userModel =
            UserModel.fromMap(userData.data() as Map<String, dynamic>);
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        userModel: userModel,
                        firebaseUser: userCredential!.user!,
                      )));
        }
      }
    }
  }
}
