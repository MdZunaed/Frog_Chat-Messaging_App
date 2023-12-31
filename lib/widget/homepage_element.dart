import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/profile_page/profile_page.dart';
import 'package:frog_chat/models/UserModel.dart';
import '../style.dart';

class BarIcon extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onTap;
  final IconData? icon;
  const BarIcon(
      {super.key, this.icon, required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(7).w,
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBgColor,
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
  final UserModel userModel;
  final imageName;

  const BarImage({super.key, required this.userModel, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(userModel: userModel)));
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
                image: NetworkImage(imageName), fit: BoxFit.cover)),
      ),
    );
  }
}

class ActiveNow extends StatelessWidget {
  const ActiveNow({super.key, required this.imgName, required this.name});
  final imgName;
  final String name;

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
        Text(name, textAlign: TextAlign.center, style: kTextStyle),
      ],
    );
  }
}
