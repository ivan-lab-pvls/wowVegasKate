import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/theme.dart';

class InfoColumn extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  const InfoColumn({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageAsset,
          width: 280.r,
          height: 280.r,
        ),
        Text(
          title,
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: 10.h),
        Text(
          subtitle,
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(color: secondaryColor),
        ),
      ],
    );
  }
}
