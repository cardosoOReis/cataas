// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatEntityAdapter extends TypeAdapter<CatEntity> {
  @override
  final int typeId = 0;

  @override
  CatEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatEntity(
      id: fields[0] as String,
      type: fields[1] as String,
      createdAt: fields[2] as String,
      url: fields[3] as String,
      tags: (fields[4] as List?)?.cast<String>(),
      text: fields[5] as String?,
      textColor: fields[6] as String?,
      filter: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.textColor)
      ..writeByte(7)
      ..write(obj.filter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
