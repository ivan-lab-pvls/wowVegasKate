// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 3;

  @override
  Game read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Game.poker;
      case 1:
        return Game.roulette;
      case 2:
        return Game.blackjack;
      case 3:
        return Game.baccarat;
      case 4:
        return Game.keno;
      case 5:
        return Game.craps;
      case 6:
        return Game.sportsBetting;
      case 7:
        return Game.videoPoker;
      default:
        return Game.poker;
    }
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    switch (obj) {
      case Game.poker:
        writer.writeByte(0);
        break;
      case Game.roulette:
        writer.writeByte(1);
        break;
      case Game.blackjack:
        writer.writeByte(2);
        break;
      case Game.baccarat:
        writer.writeByte(3);
        break;
      case Game.keno:
        writer.writeByte(4);
        break;
      case Game.craps:
        writer.writeByte(5);
        break;
      case Game.sportsBetting:
        writer.writeByte(6);
        break;
      case Game.videoPoker:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
