import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_app/data_layer/entity/display/product_info/product_info.entity.dart';

part 'view_module.entity.g.dart';

@HiveType(typeId: 0)
class ViewModuleEntity extends HiveObject {
  @HiveField(0, defaultValue: '')
  String type;

  @HiveField(1, defaultValue: '')
  String title;

  @HiveField(2, defaultValue: '')
  String subtitle;

  @HiveField(3, defaultValue: '')
  String imageUrl;

  @HiveField(4, defaultValue: [])
  List<ProductInfoEntity> products;

  @HiveField(5, defaultValue: -1)
  int time;

  ViewModuleEntity({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.products,
    required this.time,
  });
}
