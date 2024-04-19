// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttractionAdapter extends TypeAdapter<Attraction> {
  @override
  final int typeId = 2;

  @override
  Attraction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Attraction.atmosphere;
      case 1:
        return Attraction.drinks;
      case 2:
        return Attraction.food;
      case 3:
        return Attraction.price;
      case 4:
        return Attraction.staff;
      case 5:
        return Attraction.location;
      case 6:
        return Attraction.music;
      case 7:
        return Attraction.interior;
      default:
        return Attraction.atmosphere;
    }
  }

  @override
  void write(BinaryWriter writer, Attraction obj) {
    switch (obj) {
      case Attraction.atmosphere:
        writer.writeByte(0);
        break;
      case Attraction.drinks:
        writer.writeByte(1);
        break;
      case Attraction.food:
        writer.writeByte(2);
        break;
      case Attraction.price:
        writer.writeByte(3);
        break;
      case Attraction.staff:
        writer.writeByte(4);
        break;
      case Attraction.location:
        writer.writeByte(5);
        break;
      case Attraction.music:
        writer.writeByte(6);
        break;
      case Attraction.interior:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttractionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
