import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool share = true;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
            previousPageTitle: 'Back',
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CupertinoListSection.insetGrouped(
                  backgroundColor: Colors.transparent,
                  dividerMargin: 0,
                  additionalDividerMargin: 0,
                  children: [
                    CupertinoListTile(
                      backgroundColor: surfaceColor,
                      title: const Text('Terms & Conditions'),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                      onTap: () => context.router.push(const TermsOfUseRoute()),
                    ),
                    CupertinoListTile(
                      backgroundColor: surfaceColor,
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                      onTap: () =>
                          context.router.push(const PrivacyPolicyRoute()),
                    ),
                    CupertinoListTile(
                      backgroundColor: surfaceColor,
                      title: const Text('Support Page'),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                      onTap: () => context.router.push(const SupportRoute()),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  backgroundColor: Colors.transparent,
                  dividerMargin: 0,
                  additionalDividerMargin: 0,
                  children: [
                    CupertinoListTile(
                      backgroundColor: surfaceColor,
                      title: const Text('Rate Us'),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        final InAppReview inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                    ),
                    Builder(builder: (ctx) {
                      return CupertinoListTile(
                        backgroundColor: surfaceColor,
                        title: const Text('Share App'),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                        ),
                        onTap: () async {
                          if (share) {
                            share = false;
                            final box = ctx.findRenderObject() as RenderBox?;
                            await Share.shareWithResult(
                                    'Check out this Wow place - Favorite moment app!',
                                    sharePositionOrigin:
                                        box!.localToGlobal(Offset.zero) &
                                            box.size)
                                .whenComplete(() => share = true);
                          }
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
