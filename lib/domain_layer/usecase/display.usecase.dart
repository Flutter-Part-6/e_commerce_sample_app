import 'package:injectable/injectable.dart';

import 'base_usecase/remote.usecase.dart';
import 'package:sample_app/domain_layer/repository/display.repository.dart';

@singleton
class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_displayRepository);
  }
}
