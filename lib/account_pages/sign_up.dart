import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/otp_page.dart';
import 'package:frog_chat/account_pages/success.dart';
import 'package:frog_chat/element.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import 'input_fields/password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();
  void createAccount() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    String cpass = cpassController.text.trim();
    UserCredential? userCredential;

    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      //toast().toastmessage("User created");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SuccessPage()));
    } on FirebaseAuthException catch (error) {
      toast().toastmessage(error.message!);
      setState(() {
        loading = false;
      });
    }
    if (userCredential != null) {
      String uid = userCredential.user!.uid;
      UserModel newUser = UserModel(
        uid: uid,
        name: name,
        email: email,
        pic: "",
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toMap());
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Sign up - Frog Chat", style: kHeadingStyle)
                  ]),
                  gap,
                  const GetPic(),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-1",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  InputField(
                      controller: nameController, text: "Enter your full name"),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-2",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  InputField(
                      controller: emailController, text: "Your Email Address"),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-3",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  PasswordField(
                      controller: passController,
                      hintText: "Enter yout Password"),
                  gap,
                  PasswordField(
                      controller: cpassController,
                      hintText: "Confirm Password"),
                  gap,
                  gap,
                  gap,
                  loading
                      ? CircularProgressIndicator()
                      : InkWell(
                          child: Button(text: "Sign Up"),
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            createAccount();
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => const OtpPage()));
                          },
                        ),
                ]),
          ),
        ),
      ),
    );
  }
}

class GetPic extends StatelessWidget {
  const GetPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 55.r,
        backgroundColor: kDarkColor,
        child: const Icon(Icons.image, size: 50, color: kSecondayColor),
      ),
      Positioned(
          right: 0,
          bottom: 0,
          child: Container(
              height: 45.h,
              width: 45.w,
              decoration: const BoxDecoration(
                  color: kPrimaryColor, shape: BoxShape.circle),
              child: PopupMenuButton(
                  icon: const Icon(Icons.edit_document, color: kDarkColor),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: Text("Take Picture",
                                style:
                                    kTitleStyle.copyWith(color: kDarkColor))),
                        PopupMenuItem(
                            child: Text("From Gallery",
                                style:
                                    kTitleStyle.copyWith(color: kDarkColor))),
                      ]))),
    ]);
  }
}
