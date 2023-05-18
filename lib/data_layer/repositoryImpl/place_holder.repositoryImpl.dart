/// API
import 'package:injectable/injectable.dart';

import '../data_source/remote/place_holder_api_sample.dart';

/// Interface
import '../../domain_layer/repository/place_holder.repository.dart';

/// Model & Mapper
import 'package:sample_app/data_layer/common/mapper/place_holder.mapper.dart';
import 'package:sample_app/domain_layer/model/place_holder_sample.model.dart';

@Singleton(as: PlaceHolderRepository)
class PlaceHolderRepositoryImpl implements PlaceHolderRepository {
  PlaceHolderRepositoryImpl(this.placeHolderApi);

  final PlaceHolderApi placeHolderApi;

  @override
  Future<List<Post>> getPosts({
    Map<String, String>? queries,
  }) async {
    final response = await placeHolderApi.getPosts();

    final List<Post> posts =
        response.map((postDto) => postDto.toModel()).toList();

    return posts;
  }

  @override
  Future<Post> getPostById({
    required String id,
    Map<String, String>? queries,
  }) async {
    final postDto = await placeHolderApi.getPostById(id: id);

    return postDto.toModel();
  }

  @override
  Future<List<User>> getUsers({
    Map<String, String>? queries,
  }) async {
    final response = await placeHolderApi.getUsers();

    final List<User> users =
        response.map((userDto) => userDto.toModel()).toList();

    return users;
  }

  @override
  Future<User> getUserById({
    required String id,
    Map<String, String>? queries,
  }) async {
    final userDto = await placeHolderApi.getUserById(id: id);

    return userDto.toModel();
  }
}
