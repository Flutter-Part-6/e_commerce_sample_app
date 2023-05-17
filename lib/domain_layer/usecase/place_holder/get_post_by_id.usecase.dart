import '../../model/place_holder_sample/post/post.model.dart';
import '../../repository/place_holder.repository.dart';

import '../base_usecase/remote.usecase.dart';

class GetPostById extends RemoteUsecase<PlaceHolderRepository> {
  GetPostById({required this.id, this.params});
  final Map<String, String>? params;
  final String id;

  @override
  Future<Post> execute(PlaceHolderRepository repository) async {
    final response = await repository.getPostById(id: id);

    return response;
  }
}
