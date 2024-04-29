import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';

class PreviewFoxa extends StatefulWidget {
  final String mainaxa;
  final String promx;
  final String canxa;

  PreviewFoxa({
    required this.mainaxa,
    required this.promx,
    required this.canxa,
  });

  @override
  State<PreviewFoxa> createState() => _PreviewFoxaState();
}

class _PreviewFoxaState extends State<PreviewFoxa> {
  late AppsflyerSdk _appsflyerSdk;
  String adId = '';
  String paramsFirst = '';
  final InAppReview inAppReview = InAppReview.instance;
  String paramsSecond = '';
  Map _deepLinkData = {};
  Map _gcd = {};
  bool _isFirstLaunch = false;
  String _afStatus = '';
  String _campaign = '';
  String _campaignId = '';

  @override
  void initState() {
    super.initState();
    getTracking();
    afStart();
  }

  Future<void> getTracking() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    print(status);
  }

  Future<void> fetchData() async {
    adId = await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  void afStart() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'knxyqhoEmbXe4zrXV6ocB7',
      appId: '6499025327',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
    _appsflyerSdk.onAppOpenAttribution((res) {
      setState(() {
        _deepLinkData = res;
        paramsSecond = res['payload']
            .entries
            .where((e) => ![
                  'install_time',
                  'click_time',
                  'af_status',
                  'is_first_launch'
                ].contains(e.key))
            .map((e) => '&${e.key}=${e.value}')
            .join();
      });
    });
    _appsflyerSdk.onInstallConversionData((res) {
      print(res);
      setState(() {
        _gcd = res;
        _isFirstLaunch = res['payload']['is_first_launch'];
        _afStatus = res['payload']['af_status'];
        paramsFirst = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
      });
      paramsFirst = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
    });

    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          print(dp.deepLink?.toString());
          print("deep link value: ${dp.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
      print("onDeepLinking res: " + dp.toString());
      setState(() {
        _deepLinkData = dp.toJson();
      });
    });

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(widget.mainaxa),
          ),
        ),
      ),
    );
  }
}

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
