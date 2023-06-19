import '../../../../common/constants.dart';
import '../../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetCollectionsByStoreType extends RemoteUsecase<DisplayRepository> {
  final Map<String, String>? params;
  final StoreType storeType;

  GetCollectionsByStoreType({required this.storeType, this.params});

  @override
  Future<List<Collection>> execute(DisplayRepository repository) async {
    final result = await repository.getCollectionsByStoreType(
      storeType: storeType.name,
    );

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
