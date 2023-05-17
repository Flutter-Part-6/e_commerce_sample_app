import 'package:sample_app/domain_layer/model/place_holder_sample.model.dart';
import 'package:sample_app/domain_layer/repository/repository.dart';

abstract class PlaceHolderRepository extends Repository {
  // get post list
  Future<List<Post>> getPosts({
    Map<String, String>? queries,
  });

  //get post single value
  Future<Post> getPostById({
    required String id,
    Map<String, String>? queries,
  });

  // get user list
  Future<List<User>> getUsers({
    Map<String, String>? queries,
  });

  //get user single value
  Future<User> getUserById({
    required String id,
    Map<String, String>? queries,
  });
}
