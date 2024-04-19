import 'package:hive_flutter/hive_flutter.dart';
import 'package:vegas/features/home/models/enum/attraction/attraction.dart';
import 'package:vegas/features/home/models/enum/companionship/companionship.dart';
import 'package:vegas/features/home/models/enum/feedback/feedback.dart';
import 'package:vegas/features/home/models/enum/games/games.dart';

part 'place.g.dart';

@HiveType(typeId: 5)
class Place {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final DateTime? date;
  @HiveField(4)
  final FeedBack? feedback;
  @HiveField(5)
  final int? duration;
  @HiveField(6)
  final Companionship? companionship;
  @HiveField(7)
  final List<Attraction>? attractions;
  @HiveField(8)
  final List<Game>? games;
  @HiveField(9)
  final bool? willReturn;

  Place({
    required this.name,
    required this.description,
    required this.address,
    required this.date,
    required this.feedback,
    required this.duration,
    required this.companionship,
    required this.attractions,
    required this.games,
    required this.willReturn,
  });

  Place copyWith({
    String? name,
    String? description,
    String? address,
    DateTime? date,
    FeedBack? feedback,
    int? duration,
    Companionship? companionship,
    List<Attraction>? attractions,
    List<Game>? games,
    bool? willReturn,
  }) {
    return Place(
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      date: date ?? this.date,
      feedback: feedback ?? this.feedback,
      duration: duration ?? this.duration,
      companionship: companionship ?? this.companionship,
      attractions: attractions ?? this.attractions,
      games: games ?? this.games,
      willReturn: willReturn ?? this.willReturn,
    );
  }

  factory Place.empty() {
    return Place(
      name: null,
      description: null,
      address: null,
      date: null,
      feedback: null,
      duration: null,
      companionship: null,
      attractions: null,
      games: null,
      willReturn: null,
    );
  }
}
