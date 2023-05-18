import 'package:injectable/injectable.dart';

import 'base_usecase/remote.usecase.dart';
import 'package:sample_app/domain_layer/repository/display.repository.dart';

@singleton
class DisplayUsecase {
  DisplayUsecase(this._displayRepository);
  final DisplayRepository _displayRepository;

  Future<dynamic> fetch(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_displayRepository);
  }
}
