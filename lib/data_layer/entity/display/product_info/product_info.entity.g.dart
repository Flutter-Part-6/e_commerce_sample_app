// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductInfoEntityAdapter extends TypeAdapter<ProductInfoEntity> {
  @override
  final int typeId = 1;

  @override
  ProductInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductInfoEntity(
      title: fields[0] == null ? '' : fields[0] as String,
      imageUrl: fields[1] == null ? '' : fields[1] as String,
      price: fields[3] == null ? 0 : fields[3] as int,
      subtitle: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductInfoEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
