import 'package:hive_flutter/hive_flutter.dart';

part 'data_source.entity.g.dart';

@HiveType(typeId: 3)
class DataSourceEntity extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int dataSource;

  DataSourceEntity({required this.dataSource});
}
