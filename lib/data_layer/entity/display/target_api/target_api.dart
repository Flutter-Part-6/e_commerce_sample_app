import 'package:hive_flutter/hive_flutter.dart';

part 'target_api.g.dart';

@HiveType(typeId: 4)
enum TargetApi {
  @HiveField(0)
  REMOTE,
  @HiveField(1)
  MOCK,
}
