import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/splash_screen.dart';
import 'package:frog_chat/style.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          title: "Frog Chat",
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: kBgColor,
            appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: kBgColor,
                titleTextStyle: kTitleStyle,
                iconTheme: const IconThemeData(color: kWhiteColor)),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: kPrimaryColor, secondary: kSecondayColor, background: kBgColor),
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
