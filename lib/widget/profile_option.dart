import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/style.dart';

class ProfileOption extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String optionName;

  const ProfileOption({super.key, required this.icon, required this.optionName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5).h,
            height: 48.h,
            width: 48.w,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: kDarkColor),
            child: Icon(
              icon,
              color: kPrimaryColor,
            ),
          ),
          gaph,
          Text(optionName, style: kTextStyle.copyWith(fontSize: 19.sp))
        ],
      ),
    );
  }
}
