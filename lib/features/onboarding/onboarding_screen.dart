import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/orange_button.dart';
import 'package:vegas/custom/section.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 2;
    final height = MediaQuery.of(context).size.height / 1.6;
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/onb1.png',
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Your Vegas Places',
                      textAlign: TextAlign.center,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle,
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.w),
                      child: Text(
                        'Open the app and add your visited and favorite places in Vegas!',
                        textAlign: TextAlign.center,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: secondaryColor),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/onb2.png',
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Always with you',
                      textAlign: TextAlign.center,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle,
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.w),
                      child: Text(
                        'Add your favorite places using the application and they will always be at hand!',
                        textAlign: TextAlign.center,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: secondaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Section(
                  children: [
                    OrangeButton(
                        title: 'Continue',
                        onPressed: () {
                          if (page != 1) {
                            setState(() {
                              pageController.animateToPage(
                                ++page,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.decelerate,
                              );
                            });
                          } else {
                            context.router.push(const InfoRoute());
                          }
                        }),
                  ],
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 4.h,
                      width: page == 0 ? 56.w : 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: page == 0 ? primaryColor : secondaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 4.h,
                      width: page == 1 ? 56.w : 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: page == 1 ? primaryColor : secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
