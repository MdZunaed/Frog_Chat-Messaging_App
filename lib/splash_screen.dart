import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frog_chat/Screen/home_page/home_page.dart';
import 'package:frog_chat/account_pages/login.dart';
import 'package:frog_chat/account_pages/sign_up.dart';
import 'package:frog_chat/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      (FirebaseAuth.instance.currentUser != null)
                          ? const HomePage()
                          : const LoginPage()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
