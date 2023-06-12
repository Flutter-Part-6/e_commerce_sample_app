import 'package:sample_app/domain_layer/repository/repository.dart';

abstract class RemoteUsecase<T extends Repository> {
  Future execute(T repository);
}
