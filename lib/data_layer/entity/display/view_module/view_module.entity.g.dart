// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViewModuleEntityAdapter extends TypeAdapter<ViewModuleEntity> {
  @override
  final int typeId = 0;

  @override
  ViewModuleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViewModuleEntity(
      type: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ViewModuleEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewModuleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}