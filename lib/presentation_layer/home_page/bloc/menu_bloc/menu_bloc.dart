import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/exceptions/network_exception.dart';
import '../../../../common/utils/exceptions/service_exception.dart';
import '../../../../common/utils/logger.dart';
import '../../../../domain_layer/model/display/menu/menu.model.dart';
import '../../../../domain_layer/usecase/display.usecase.dart';
import '../../../../common/constants.dart';
import '../../../../domain_layer/usecase/display/menu/menu.usecase.dart';

part 'menu_event.dart';

part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc(this._displayUsecase) : super(MenuState()) {
    on<MenuInitialized>(_onMenusInitialized);
    on<ToggledMallTypes>(_onToggledMallTypes);
  }

  /// GNB bar(collections bar) 초기화
  Future<void> _onMenusInitialized(
    MenuInitialized event,
    Emitter<MenuState> emit,
  ) async {
    final mallType = event.mallType ?? MallType.market;

    emit(state.copyWith(
      status: Status.loading,
      mallType: mallType,
    ));

    try {
      final List<Menu> menus = await _fetch(mallType: mallType);
      final int currentTabId = menus.first.tabId;

      _validateMenus(menus);

      emit(
        state.copyWith(
          status: Status.success,
          currentTabId: currentTabId,
          menus: menus,
        ),
      );
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
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<void> _onToggledMallTypes(
    ToggledMallTypes event,
    Emitter<MenuState> emit,
  ) async {
    if (!state.status.isSuccess) return;

    if (state.mallType.index == event.tabIndex) return;

    emit(state.copyWith(status: Status.loading));

    //입력 받은 mallType
    final mallType = MallType.values[event.tabIndex];

    try {
      final List<Menu> menus = await _fetch(mallType: mallType);

      _validateMenus(menus);

      emit(
        state.copyWith(
          status: Status.success,
          mallType: mallType,
          menus: menus,
        ),
      );
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
      CustomLogger.logger.e('${error.toString()}');
    }
  }

  Future<List<Menu>> _fetch({required MallType mallType}) async {
    return await _displayUsecase.fetch(GetMenus(mallType: mallType));
  }
}

void _validateMenus(List<Menu> collections) {
  // collections bar의 데이터가 없는 경우
  if (collections.isEmpty) {
    final code = 'GNB-0000';
    final status = 'collection data is empty';
    final message = '서비스에 일시적인 오류가 발생했습니다. 잠시 후에 다시 시도해주세요';

    throw ServiceException(code: code, status: status, message: message);
  }
}
