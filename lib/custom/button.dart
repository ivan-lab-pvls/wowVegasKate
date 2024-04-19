import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool accent;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      color: accent ? primaryColor : surfaceColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: accent ? FontWeight.w600 : FontWeight.w400,
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
