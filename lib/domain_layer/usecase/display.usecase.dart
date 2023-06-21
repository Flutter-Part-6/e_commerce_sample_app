import 'package:injectable/injectable.dart';

import '../repository/display.repository.dart';
import 'base_usecase/remote.usecase.dart';

@singleton
class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_displayRepository);
  }
}
