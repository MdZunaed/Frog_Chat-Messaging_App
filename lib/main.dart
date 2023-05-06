import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/home_page/home_page.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/models/firebase_helper.dart';
import 'package:frog_chat/splash_screen.dart';
import 'package:frog_chat/style.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    UserModel? userModel = await FirebaseHelper.userModelByUid(currentUser.uid);
    if (userModel != null) {
      runApp(MyApp(
        userModel: userModel,
        firebaseUser: currentUser,
      ));
    }
  } else {
    runApp(const NewApp());
  }
}

class MyApp extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyApp({super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: kBgColor,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: kPrimaryColor,
                  secondary: kSecondayColor,
                  background: kBgColor),
              textTheme:
                  const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(userModel: userModel, firebaseUser: firebaseUser)
            //SplashScreen(userModel: userModel, firebaseUser: firebaseUser),
            );
      },
    );
  }
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: kBgColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: kPrimaryColor,
                secondary: kSecondayColor,
                background: kBgColor),
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          ),
          debugShowCheckedModeBanner: false,
          home:
              //const LoginPage(),
              const SplashScreen(
                  //userModel: userModel, firebaseUser: firebaseUser
                  ),
        );
      },
    );
  }
}
