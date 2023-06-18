import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class ChangeCartQtyByProductIdAndQty extends RemoteUsecase<DisplayRepository> {
  final String productId;
  final int qty;

  ChangeCartQtyByProductIdAndQty({required this.productId, required this.qty});

  @override
  Future<bool> execute(DisplayRepository repository) async {
    final result =
        await repository.changeCartQuantity(productId: productId, qty: qty);

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
