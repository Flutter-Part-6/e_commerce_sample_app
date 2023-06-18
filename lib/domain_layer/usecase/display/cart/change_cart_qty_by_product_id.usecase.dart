import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class ChangeCartQtyByProductIdAndQty extends RemoteUsecase<DisplayRepository> {
  final String productId;
  final int qty;

  ChangeCartQtyByProductIdAndQty({required this.productId, required this.qty});

  @override
  Future<void> execute(DisplayRepository repository) async {
    await repository.changeCartQuantity(productId: productId, qty: qty);
  }
}
