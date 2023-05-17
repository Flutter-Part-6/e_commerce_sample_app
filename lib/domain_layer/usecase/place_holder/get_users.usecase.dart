import '../../model/place_holder_sample/user/user.model.dart';
import '../../repository/place_holder.repository.dart';

import '../base_usecase/remote.usecase.dart';

class GetUsers extends RemoteUsecase<PlaceHolderRepository> {
  GetUsers({this.params});
  final Map<String, String>? params;

  @override
  Future<List<User>> execute(PlaceHolderRepository repository) async {
    final response = await repository.getUsers();
    return response;
  }
}
