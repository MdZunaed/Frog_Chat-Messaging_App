import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/otp_page.dart';
import 'package:frog_chat/account_pages/success.dart';
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

    try {
      if (email == "" || pass == "" || cpass == "") {
        Fluttertoast.showToast(
            msg: "Fill all the info",
            textColor: kDarkColor,
            backgroundColor: kPrimaryColor);
      } else if (pass != cpass) {
        Fluttertoast.showToast(
            msg: "Password do not match",
            textColor: kDarkColor,
            backgroundColor: kPrimaryColor);
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        // Fluttertoast.showToast(
        //     msg: "User created",
        //     textColor: kDarkColor,
        //     backgroundColor: kPrimaryColor);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SuccessPage()));
        await FirebaseFirestore.instance
            .collection("user")
            .doc(userCredential.user!.uid)
            .set({"name": name, "email": email, "password": pass});
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
                  InkWell(
                    child: Button(text: "Sign Up"),
                    onTap: () {
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
