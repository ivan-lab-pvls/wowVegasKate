import 'package:hive_flutter/hive_flutter.dart';

part 'companionship.g.dart';

@HiveType(typeId: 1)
enum Companionship {
  @HiveField(0)
  alone('Alone'),
  @HiveField(1)
  withCompany('With company');

  final String title;

  const Companionship(this.title);
}
