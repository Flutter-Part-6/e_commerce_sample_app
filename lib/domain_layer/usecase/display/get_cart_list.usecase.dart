import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../repository/display.repository.dart';
import '../base_usecase/remote.usecase.dart';

class GetCartList extends RemoteUsecase<DisplayRepository> {
  GetCartList();

  @override
  Future<List<Cart>> execute(DisplayRepository repository) async {
    final response = repository.getCartList();

    return response;
  }
}
