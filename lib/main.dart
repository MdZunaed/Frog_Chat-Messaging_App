import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/splash_screen.dart';
import 'package:frog_chat/style.dart';

void main() {
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: kPrimaryColor,
                secondary: kSecondayColor,
                background: kBgColor),
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
