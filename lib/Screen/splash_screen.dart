import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frog_chat/Screen/account_pages/login_page.dart';
import 'package:frog_chat/Screen/home_page/home_page.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';

import '../models/firebase_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkAuthState() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      UserModel? userModel = await FirebaseHelper.userModelByUid(currentUser.uid);
      if (userModel != null && mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(userModel: userModel, firebaseUser: currentUser)));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {checkAuthState()});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage("images/frog-splash.png"),
              width: 250,
            ),
            SizedBox(height: 30),
            SpinKitWave(
              color: kPrimaryColor,
              itemCount: 6,
              size: 45,
            ),
          ]),
        ),
      ),
    );
  }
}
