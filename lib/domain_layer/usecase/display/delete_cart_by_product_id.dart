import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../repository/display.repository.dart';
import '../base_usecase/remote.usecase.dart';

class DeleteCartByProductId extends RemoteUsecase<DisplayRepository> {
  DeleteCartByProductId({required this.productId});

  final String productId;

  @override
  Future<void> execute(DisplayRepository repository) async {
    await repository.deleteCart(productId);
  }
}
