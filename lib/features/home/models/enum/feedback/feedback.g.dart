// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedBackAdapter extends TypeAdapter<FeedBack> {
  @override
  final int typeId = 0;

  @override
  FeedBack read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FeedBack.yes;
      case 1:
        return FeedBack.probablyYes;
      case 2:
        return FeedBack.probablyNo;
      case 3:
        return FeedBack.no;
      default:
        return FeedBack.yes;
    }
  }

  @override
  void write(BinaryWriter writer, FeedBack obj) {
    switch (obj) {
      case FeedBack.yes:
        writer.writeByte(0);
        break;
      case FeedBack.probablyYes:
        writer.writeByte(1);
        break;
      case FeedBack.probablyNo:
        writer.writeByte(2);
        break;
      case FeedBack.no:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedBackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
