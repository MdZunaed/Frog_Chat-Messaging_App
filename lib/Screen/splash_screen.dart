import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frog_chat/Screen/account_pages/login_page.dart';
import 'package:frog_chat/style.dart';

class SplashScreen extends StatefulWidget {
  // final UserModel userModel;
  // final User firebaseUser;

  const SplashScreen({
    super.key,
    //required this.userModel, required this.firebaseUser
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      //(currentUser != null)
                      // ? HomePage(
                      //     userModel: widget.userModel,
                      //     firebaseUser: widget.firebaseUser):
                      const LoginPage()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
