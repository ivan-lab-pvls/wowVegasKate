import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vegas/app/init/init_di.dart';
import 'package:vegas/app/init/init_firebase.dart';
import 'package:vegas/app/init/init_hive.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/home/place_list_cubit.dart';

bool? isFirstTime;
String? privacyPolicy;
String? termsOfUse;
String? promotion;
String? support;

final locator = GetIt.instance;

late Box<Place> placesBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initFirebase();
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
        return CupertinoApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
        );
      },
    );
  }
}
