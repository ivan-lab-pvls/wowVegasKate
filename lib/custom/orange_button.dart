import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/theme.dart';

class OrangeButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const OrangeButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(245, 156, 11, 1),
                    Color.fromRGBO(249, 116, 21, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
