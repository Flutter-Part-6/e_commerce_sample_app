// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sample_app/data_layer/data_source/datasource_module.dart'
    as _i19;
import 'package:sample_app/data_layer/data_source/local_storage/display_dao.dart'
    as _i5;
import 'package:sample_app/data_layer/data_source/mock/mock.dart' as _i10;
import 'package:sample_app/data_layer/data_source/remote/display_api.dart'
    as _i4;
import 'package:sample_app/data_layer/data_source/remote/user_api.dart' as _i12;
import 'package:sample_app/data_layer/repositoryImpl/display.repositoryImpl.dart'
    as _i7;
import 'package:sample_app/data_layer/repositoryImpl/user.repositoryimpl.dart'
    as _i14;
import 'package:sample_app/domain_layer/repository/display.repository.dart'
    as _i6;
import 'package:sample_app/domain_layer/repository/user.repository.dart'
    as _i13;
import 'package:sample_app/domain_layer/usecase/display.usecase.dart' as _i8;
import 'package:sample_app/domain_layer/usecase/user.usecase.dart' as _i15;
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart'
    as _i17;
import 'package:sample_app/presentation_layer/common/bloc/payment_bloc/payment_bloc.dart'
    as _i11;
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart'
    as _i18;
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart'
    as _i3;
import 'package:sample_app/presentation_layer/home_page/bloc/menu_bloc/menu_bloc.dart'
    as _i9;
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataSourceModule = _$DataSourceModule();
    gh.factory<_i3.CartBloc>(() => _i3.CartBloc());
    gh.singleton<_i4.DisplayApi>(dataSourceModule.displayApi);
    gh.singleton<_i5.DisplayDao>(dataSourceModule.displayDao);
    gh.singleton<_i6.DisplayRepository>(_i7.DisplayRepositoryImpl(
      gh<_i4.DisplayApi>(),
      gh<_i5.DisplayDao>(),
    ));
    gh.singleton<_i8.DisplayUsecase>(
        _i8.DisplayUsecase(gh<_i6.DisplayRepository>()));
    gh.factory<_i9.MenuBloc>(() => _i9.MenuBloc(gh<_i8.DisplayUsecase>()));
    gh.singleton<_i10.MockApi>(dataSourceModule.mockApi);
    gh.factory<_i11.PaymentBloc>(() => _i11.PaymentBloc());
    gh.singleton<_i12.UserApi>(dataSourceModule.userApi);
    gh.singleton<_i13.UserRepository>(
        _i14.UserRepositoryImpl(gh<_i12.UserApi>()));
    gh.singleton<_i15.UserUsecase>(_i15.UserUsecase(gh<_i13.UserRepository>()));
    gh.factory<_i16.ViewModulesBloc>(
        () => _i16.ViewModulesBloc(gh<_i8.DisplayUsecase>()));
    gh.factory<_i17.CartListBloc>(
        () => _i17.CartListBloc(gh<_i8.DisplayUsecase>()));
    gh.factory<_i18.UserBloc>(() => _i18.UserBloc(gh<_i15.UserUsecase>()));
    return this;
  }
}

class _$DataSourceModule extends _i19.DataSourceModule {}
