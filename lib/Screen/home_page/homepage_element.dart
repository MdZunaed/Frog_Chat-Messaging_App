import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/profile_page/profile_page.dart';
import 'package:frog_chat/Screen/search_page/search_page.dart';
import '../../style.dart';

class BarIcon extends StatelessWidget {
  BarIcon({super.key, this.icon});
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchPage()));
      },
      child: Container(
        margin: const EdgeInsets.all(7).w,
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kDarkColor,
            border: Border.all(color: kSecondayColor, width: 2.w)),
        child: const Icon(
          Icons.search,
          color: kSecondayColor,
        ),
      ),
    );
  }
}

class BarImage extends StatelessWidget {
  BarImage({super.key, this.imageName});
  final imageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      },
      child: Container(
        margin: const EdgeInsets.all(7).w,
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kDarkColor,
            border: Border.all(color: kSecondayColor, width: 2.w),
            image: DecorationImage(
                image: AssetImage("images/" + imageName), fit: BoxFit.cover)),
      ),
    );
  }
}

class ActiveNow extends StatelessWidget {
  ActiveNow({super.key, required this.imgName, required this.name});
  final imgName;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12).w,
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kDarkColor,
              //border: Border.all(color: kPrimaryColor, width: 1.w),
              image: DecorationImage(
                  image: AssetImage("images/" + imgName), fit: BoxFit.cover)),
        ),
        SizedBox(height: 5.h),
        Text(name, style: kTextStyle),
      ],
    );
  }
}
