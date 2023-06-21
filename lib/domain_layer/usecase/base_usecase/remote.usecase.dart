import '../../repository/repository.dart';

abstract class RemoteUsecase<T extends Repository> {
  Future execute(T repository);
}
