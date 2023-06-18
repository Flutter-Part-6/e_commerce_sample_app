import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class AddCart extends RemoteUsecase<DisplayRepository> {
  final Cart cart;

  AddCart({required this.cart});

  @override
  Future<bool> execute(DisplayRepository repository) async {
    final result = await repository.addCart(cart: cart);

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
