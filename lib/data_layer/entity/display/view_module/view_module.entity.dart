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
  String subtitlt;

  @HiveField(3, defaultValue: [])
  List<ProductInfoEntity> products;

  @HiveField(4, defaultValue: -1)
  int time;

  ViewModuleEntity({
    required this.type,
    required this.title,
    required this.subtitlt,
    required this.products,
    required this.time,
  });
}
