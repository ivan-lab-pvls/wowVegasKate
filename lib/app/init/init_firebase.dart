import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:vegas/app/init/firebase_options.dart';
import 'package:vegas/main.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await remoteConfig.fetchAndActivate();

  privacyPolicy =
      'https://docs.google.com/document/d/1k2022E9FgDkBCIhk_GhhLy6ZfTQXP5cP8AkQOZCLn0I/edit?usp=sharing';
  termsOfUse =
      'https://docs.google.com/document/d/1bxtWZRRiZOziVAahSqD_6BrSxGd16yTwkiMZWau6XJc/edit?usp=sharing';
  promotion = remoteConfig.getString('promotion');
  support = 'https://forms.gle/EsxseT6buJsuuHrq7';
}
