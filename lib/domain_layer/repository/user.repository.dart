import 'package:sample_app/domain_layer/repository/repository.dart';

import '../../common/utils/result/result.dart';

abstract class UserRepository extends Repository {
  // get collection list
  Future<Result<String>> getCustomToken({
    required String userId,
    String? email,
  });
}
