import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/common/dependency_injection/dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
