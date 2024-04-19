import 'package:hive_flutter/hive_flutter.dart';

part 'attraction.g.dart';

@HiveType(typeId: 2)
enum Attraction {
  @HiveField(0)
  atmosphere('🎉'),
  @HiveField(1)
  drinks('🍷'),
  @HiveField(2)
  food('🍔'),
  @HiveField(3)
  price('💰'),
  @HiveField(4)
  staff('🧑‍💼'),
  @HiveField(5)
  location('📍'),
  @HiveField(6)
  music('🎹'),
  @HiveField(7)
  interior('🪩');

  final String emoji;

  const Attraction(this.emoji);
}
