/// API
import 'package:injectable/injectable.dart';
import 'package:sample_app/domain_layer/repository/user.repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {}
