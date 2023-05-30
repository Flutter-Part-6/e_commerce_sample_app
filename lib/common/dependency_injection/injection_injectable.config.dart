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
import 'package:sample_app/data_layer/data_source/remote/api_module.dart'
    as _i17;
import 'package:sample_app/data_layer/data_source/remote/display_api.dart'
    as _i3;
import 'package:sample_app/data_layer/data_source/remote/user_api.dart' as _i8;
import 'package:sample_app/data_layer/repositoryImpl/display.repositoryImpl.dart'
    as _i5;
import 'package:sample_app/data_layer/repositoryImpl/user.repositoryimpl.dart'
    as _i10;
import 'package:sample_app/domain_layer/repository/display.repository.dart'
    as _i4;
import 'package:sample_app/domain_layer/repository/user.repository.dart' as _i9;
import 'package:sample_app/domain_layer/usecase/display.usecase.dart' as _i6;
import 'package:sample_app/domain_layer/usecase/user.usecase.dart' as _i11;
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart'
    as _i14;
import 'package:sample_app/presentation_layer/common/bloc/payment_bloc/payment_bloc.dart'
    as _i7;
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart'
    as _i16;
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart'
    as _i13;
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart'
    as _i15;
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart'
    as _i12;

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
    final apiModule = _$ApiModule();
    gh.singleton<_i3.DisplayApi>(apiModule.displayApi);
    gh.singleton<_i4.DisplayRepository>(
        _i5.DisplayRepositoryImpl(gh<_i3.DisplayApi>()));
    gh.singleton<_i6.DisplayUsecase>(
        _i6.DisplayUsecase(gh<_i4.DisplayRepository>()));
    gh.factory<_i7.PaymentBloc>(() => _i7.PaymentBloc());
    gh.singleton<_i8.UserApi>(apiModule.userApi);
    gh.singleton<_i9.UserRepository>(
        _i10.UserRepositoryImpl(gh<_i8.UserApi>()));
    gh.singleton<_i11.UserUsecase>(_i11.UserUsecase(gh<_i9.UserRepository>()));
    gh.factory<_i12.ViewModulesBloc>(
        () => _i12.ViewModulesBloc(gh<_i6.DisplayUsecase>()));
    gh.factory<_i13.CartBloc>(() => _i13.CartBloc(gh<_i6.DisplayUsecase>()));
    gh.factory<_i14.CartListBloc>(
        () => _i14.CartListBloc(gh<_i6.DisplayUsecase>()));
    gh.factory<_i15.CollectionsBloc>(
        () => _i15.CollectionsBloc(gh<_i6.DisplayUsecase>()));
    gh.factory<_i16.UserBloc>(() => _i16.UserBloc(gh<_i11.UserUsecase>()));
    return this;
  }
}

class _$ApiModule extends _i17.ApiModule {}
