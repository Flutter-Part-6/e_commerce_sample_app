import 'package:hive_flutter/hive_flutter.dart';

part 'view_module.entity.g.dart';

@HiveType(typeId: 0)
class ViewModuleEntity extends HiveObject {
  @HiveField(0)
  String type;

  @HiveField(1)
  String title;

  ViewModuleEntity({
    required this.type,
    required this.title,
  });
}
