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
import 'package:sample_app/data_layer/data_source/mock/moc_api.dart' as _i4;
import 'package:sample_app/data_layer/data_source/remote/api_module.dart'
    as _i18;
import 'package:sample_app/data_layer/data_source/remote/display_api.dart'
    as _i3;
import 'package:sample_app/data_layer/data_source/remote/user_api.dart' as _i6;
import 'package:sample_app/data_layer/repositoryImpl/display.repositoryImpl.dart'
    as _i11;
import 'package:sample_app/data_layer/repositoryImpl/user.repositoryimpl.dart'
    as _i8;
import 'package:sample_app/domain_layer/repository/display.repository.dart'
    as _i10;
import 'package:sample_app/domain_layer/repository/user.repository.dart' as _i7;
import 'package:sample_app/domain_layer/usecase/display.usecase.dart' as _i12;
import 'package:sample_app/domain_layer/usecase/user.usecase.dart' as _i9;
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart'
    as _i16;
import 'package:sample_app/presentation_layer/common/bloc/payment_bloc/payment_bloc.dart'
    as _i5;
import 'package:sample_app/presentation_layer/common/bloc/user_bloc/user_bloc.dart'
    as _i13;
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart'
    as _i15;
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart'
    as _i17;
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart'
    as _i14;

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
    gh.singleton<_i4.MockApi>(apiModule.mockApi);
    gh.factory<_i5.PaymentBloc>(() => _i5.PaymentBloc());
    gh.singleton<_i6.UserApi>(apiModule.userApi);
    gh.singleton<_i7.UserRepository>(_i8.UserRepositoryImpl(gh<_i6.UserApi>()));
    gh.singleton<_i9.UserUsecase>(_i9.UserUsecase(gh<_i7.UserRepository>()));
    gh.singleton<_i10.DisplayRepository>(_i11.DisplayRepositoryImpl(
      gh<_i3.DisplayApi>(),
      gh<_i4.MockApi>(),
    ));
    gh.singleton<_i12.DisplayUsecase>(
        _i12.DisplayUsecase(gh<_i10.DisplayRepository>()));
    gh.factory<_i13.UserBloc>(() => _i13.UserBloc(gh<_i9.UserUsecase>()));
    gh.factory<_i14.ViewModulesBloc>(
        () => _i14.ViewModulesBloc(gh<_i12.DisplayUsecase>()));
    gh.factory<_i15.CartBloc>(() => _i15.CartBloc(gh<_i12.DisplayUsecase>()));
    gh.factory<_i16.CartListBloc>(
        () => _i16.CartListBloc(gh<_i12.DisplayUsecase>()));
    gh.factory<_i17.CollectionsBloc>(
        () => _i17.CollectionsBloc(gh<_i12.DisplayUsecase>()));
    return this;
  }
}

class _$ApiModule extends _i18.ApiModule {}
