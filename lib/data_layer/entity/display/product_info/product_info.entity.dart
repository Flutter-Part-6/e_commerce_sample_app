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

  @HiveField(3, defaultValue: -1)
  int price;

  @HiveField(4, defaultValue: -1)
  int originalPrice;

  @HiveField(5, defaultValue: -1)
  int discountRate;

  @HiveField(6, defaultValue: -1)
  int reviewCount;

  ProductInfoEntity({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.discountRate,
    required this.reviewCount,
  });
}
