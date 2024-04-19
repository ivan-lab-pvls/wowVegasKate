// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companionship.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanionshipAdapter extends TypeAdapter<Companionship> {
  @override
  final int typeId = 1;

  @override
  Companionship read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Companionship.alone;
      case 1:
        return Companionship.withCompany;
      default:
        return Companionship.alone;
    }
  }

  @override
  void write(BinaryWriter writer, Companionship obj) {
    switch (obj) {
      case Companionship.alone:
        writer.writeByte(0);
        break;
      case Companionship.withCompany:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanionshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
