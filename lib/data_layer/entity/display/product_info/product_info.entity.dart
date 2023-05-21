import 'package:hive_flutter/hive_flutter.dart';

part 'product_info.entity.g.dart';

@HiveType(typeId: 1)
class ProductInfoEntity extends HiveObject {
  @HiveField(0, defaultValue: '')
  String title;

  @HiveField(1, defaultValue: '')
  String imageUrl;

  ProductInfoEntity({
    required this.title,
    required this.imageUrl,
  });
}
