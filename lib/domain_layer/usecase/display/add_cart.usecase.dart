import 'package:sample_app/domain_layer/model/display.model.dart';

import '../../repository/display.repository.dart';
import '../base_usecase/remote.usecase.dart';

class AddCart extends RemoteUsecase<DisplayRepository> {
  AddCart({required this.cart});

  final Cart cart;

  @override
  Future<void> execute(DisplayRepository repository) async {
    await repository.addCart(cart: cart);
  }
}
