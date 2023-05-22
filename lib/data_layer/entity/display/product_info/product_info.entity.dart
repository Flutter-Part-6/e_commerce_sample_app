import 'package:hive/hive.dart';

part 'product_info.entity.g.dart';

@HiveType(typeId: 1)
class ProductInfoEntity extends HiveObject {
  @HiveField(0, defaultValue: '')
  String title;

  @HiveField(1, defaultValue: '')
  String imageUrl;

  @HiveField(2, defaultValue: '')
  String subtitle;

  @HiveField(3, defaultValue: 0)
  int price;

  ProductInfoEntity({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
  });
}
