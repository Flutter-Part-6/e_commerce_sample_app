import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../repository/display.repository.dart';
import '../base_usecase/remote.usecase.dart';

class ClearCartList extends RemoteUsecase<DisplayRepository> {
  ClearCartList();

  @override
  Future<void> execute(DisplayRepository repository) async {
    await repository.clearCartList();
  }
}
