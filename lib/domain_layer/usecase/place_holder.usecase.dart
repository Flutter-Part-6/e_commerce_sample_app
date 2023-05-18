import 'package:injectable/injectable.dart';

import '../repository/place_holder.repository.dart';
import 'base_usecase/remote.usecase.dart';

@singleton
class PlaceHolderUsecase {
  PlaceHolderUsecase(this._placeHolderRepository);
  final PlaceHolderRepository _placeHolderRepository;

  Future<dynamic> fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_placeHolderRepository);
  }
}
