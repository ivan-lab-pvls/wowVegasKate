import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/info_column.dart';
import 'package:vegas/custom/orange_button.dart';
import 'package:vegas/custom/section.dart';

@RoutePage()
class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Your Places',
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 72.h),
            const InfoColumn(
              imageAsset: 'assets/confetti.png',
              title: 'Congratulations!',
              subtitle: 'You have added a new place',
            ),
            SizedBox(height: 24.h),
            Section(
              children: [
                OrangeButton(
                  title: 'Add new place',
                  onPressed: () => context.router.replace(
                    const NewPlaceRoute(),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: 'Go to Your Places',
                        onPressed: () => context.router.popForced(),
                        accent: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
