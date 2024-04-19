import 'package:hive_flutter/hive_flutter.dart';

part 'games.g.dart';

@HiveType(typeId: 3)
enum Game {
  @HiveField(0)
  poker('Poker'),
  @HiveField(1)
  roulette('Roulette'),
  @HiveField(2)
  blackjack('Blackjack'),
  @HiveField(3)
  baccarat('Baccarat'),
  @HiveField(4)
  keno('Keno'),
  @HiveField(5)
  craps('Craps'),
  @HiveField(6)
  sportsBetting('Sports Betting'),
  @HiveField(7)
  videoPoker('Video Poker');

  final String title;

  const Game(this.title);
}
