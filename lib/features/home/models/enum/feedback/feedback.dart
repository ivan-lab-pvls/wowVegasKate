import 'package:hive_flutter/hive_flutter.dart';

part 'feedback.g.dart';

@HiveType(typeId: 0)
enum FeedBack {
  @HiveField(0)
  yes('Yes'),
  @HiveField(1)
  probablyYes('Probably Yes'),
  @HiveField(2)
  probablyNo('Probably No'),
  @HiveField(3)
  no('No');

  final String title;

  const FeedBack(this.title);
}
