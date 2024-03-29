import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../../domain_layer/usecase/user/login_with_token.usecase.dart';
import '../../../../domain_layer/usecase/user.usecase.dart';
import '../../../../common/constants.dart';
import '../../../../common/utils/exceptions/network_exception.dart';
import '../../../../common/utils/exceptions/service_exception.dart';
import '../../../../common/utils/logger.dart';
import '../../../../domain_layer/usecase/user/user.usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _userUsecase;

  UserBloc(this._userUsecase) : super(UserState()) {
    on<UserLogin>(_onUserLogin);
    on<UserLoginWithToken>(_onUserLoginWithToken);
    on<UserLogout>(_onUserLogout);
  }

  Future<void> _onUserLogin(
    UserLogin event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final User? user = await _userUsecase.fetch<User?>(LoginUsecase());

      if (user == null) {
        emit(state.copyWith(status: Status.initial));
      } else {
        emit(state.copyWith(status: Status.success, user: user));
      }
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      CustomLogger.logger.e(error);
    }
  }

  Future<void> _onUserLoginWithToken(
    UserLoginWithToken event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final User? user =
          await _userUsecase.fetch<User?>(LoginWithTokenUsecase());

      // 기존 로그인 된 유저 정보 존재하지 않는 경우
      if (user == null) {
        emit(state.copyWith(status: Status.initial));
      }
      // 토큰 갱신 성공
      else {
        emit(state.copyWith(status: Status.success, user: user));
      }
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      // 유저가 수동으로 로그인 재시도 하는 상태를 만들어 주기 위해 initial로 세팅
      emit(state.copyWith(status: Status.initial));
      CustomLogger.logger.e(error);
    }
  }

  Future<void> _onUserLogout(
    UserLogout event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _userUsecase.fetch(LogoutUsecase());
      emit(state.copyWith(status: Status.initial, user: null));
    } on NetworkException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error));
    } on ServiceException catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
        status: Status.error,
        errorMsg: error.message,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      CustomLogger.logger.e(error);
    }
  }
}
