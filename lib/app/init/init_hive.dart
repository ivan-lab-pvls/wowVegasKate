import 'package:hive_flutter/hive_flutter.dart';
import 'package:vegas/app/main.dart';
import 'package:vegas/features/home/models/enum/attraction/attraction.dart';
import 'package:vegas/features/home/models/enum/companionship/companionship.dart';
import 'package:vegas/features/home/models/enum/feedback/feedback.dart';
import 'package:vegas/features/home/models/enum/games/games.dart';
import 'package:vegas/features/home/models/place/place.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FeedBackAdapter());
  Hive.registerAdapter(CompanionshipAdapter());
  Hive.registerAdapter(AttractionAdapter());
  Hive.registerAdapter(GameAdapter());
  Hive.registerAdapter(PlaceAdapter());
  placesBox = await Hive.openBox('places');
}
