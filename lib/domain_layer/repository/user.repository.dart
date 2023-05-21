import 'package:sample_app/domain_layer/repository/repository.dart';

abstract class UserRepository extends Repository {
  // get collection list
  Future<String> getCustomToken({
    required String userId,
    String? email,
  });
}
