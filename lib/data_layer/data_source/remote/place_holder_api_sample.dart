import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

// dto
import 'package:sample_app/data_layer/dto/place_holder.dto.dart';

part 'place_holder_api_sample.g.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com/';

@RestApi(baseUrl: baseUrl)
abstract class PlaceHolderApi {
  factory PlaceHolderApi(Dio dio, {String? baseUrl}) = _PlaceHolderApi;

  // about posts
  @GET('/posts')
  Future<List<PostDto>> getPosts();

  @GET('/posts/{id}')
  Future<PostDto> getPostById({@Path('id') required String id});

  // about users
  @GET('/users')
  Future<List<UserDto>> getUsers();

  @GET('/users/{id}')
  Future<UserDto> getUserById({@Path('id') required String id});
}
