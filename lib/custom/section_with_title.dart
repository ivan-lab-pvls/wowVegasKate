import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWithTitle({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(title),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}
