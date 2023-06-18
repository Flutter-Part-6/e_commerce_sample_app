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
      type: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      subtitle: fields[2] == null ? '' : fields[2] as String,
      imageUrl: fields[3] == null ? '' : fields[3] as String,
      products: fields[4] == null
          ? []
          : (fields[4] as List).cast<ProductInfoEntity>(),
      time: fields[5] == null ? -1 : fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ViewModuleEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.products)
      ..writeByte(5)
      ..write(obj.time);
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
