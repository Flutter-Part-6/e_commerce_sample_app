import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../repository/place_holder.repository.dart';
import 'base_usecase/remote.usecase.dart';

@singleton
class PlaceHolderUsecase {
  PlaceHolderUsecase(this._placeHolderRepository);
  final PlaceHolderRepository _placeHolderRepository;

  Future<T> fetch<T>(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_placeHolderRepository);
  }
}
