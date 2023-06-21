import '../../common/utils/result/result.dart';
import 'repository.dart';

abstract class UserRepository extends Repository {
  // get collection list
  Future<Result<String>> getCustomToken({
    required String userId,
    String? email,
  });
}
