// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesAdapter extends TypeAdapter<notes> {
  @override
  final int typeId = 1;

  @override
  notes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notes()
      ..title = fields[0] as String
      ..content = fields[1] as String
      ..createdDate = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, notes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
