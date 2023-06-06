import '../../repository/display.repository.dart';
import '../base_usecase/remote.usecase.dart';

class DeleteCartByProductId extends RemoteUsecase<DisplayRepository> {
  final List<String> productIds;

  DeleteCartByProductId({required this.productIds});

  @override
  Future<void> execute(DisplayRepository repository) async {
    await repository.deleteCart(productIds);
  }
}
