import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas/app/main.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/nav_bar_button.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';

@RoutePage()
class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = TextEditingController();
  int alone = -1;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: CupertinoNavigationBarBackButton(
              previousPageTitle: 'Back',
              onPressed: () => context.router.popForced(),
            ),
            largeTitle: const Text('Information'),
            border: null,
            trailing: NavBarButton(
              title: 'Next',
              onPressed: () {
                locator<SharedPreferences>().setBool('isFirstTime', false);
                context.router.replaceAll([const HomeRoute()]);
              },
              active: controller.text.isNotEmpty && alone != -1,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SectionWithTitle(
                  title: 'Your name',
                  child: CustomTextfield(
                    placeholder: 'Type name here',
                    controller: controller,
                    onChanged: () => setState(() {}),
                  ),
                ),
                SizedBox(height: 24.h),
                SectionWithTitle(
                  title: 'You like party alone or with company?',
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: CustomButton(
                            title: 'Alone',
                            onPressed: () {
                              setState(() => alone = 0);
                            },
                            accent: alone == 0,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: CustomButton(
                            title: 'With company',
                            onPressed: () => setState(() => alone = 1),
                            accent: alone == 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
