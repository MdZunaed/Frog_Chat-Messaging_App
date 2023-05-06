import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/input_fields/password.dart';
import 'package:frog_chat/account_pages/sign_up.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import '../Screen/home_page/home_page.dart';
import '../elements/show_toast.dart';

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
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      //if (userCredential != null) {

      toast().toastmessage("Login successfully");
      //}
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    userModel: userModel,
                    firebaseUser: userCredential!.user!,
                  )));
    }
  }

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
                        onPressed: () {
                          toast().toastmessage("Not available right now");
                        }),
                  ],
                ),
                SizedBox(height: 8.h),

                //gap,
                loading
                    ? const CircularProgressIndicator()
                    : InkWell(
                        child: const Button(text: "Log in"),
                        onTap: () {
                          logIn();
                          setState(() {
                            loading = true;
                          });
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
                    children: const [
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
