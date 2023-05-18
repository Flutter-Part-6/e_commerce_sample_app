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
    as _i14;
import 'package:sample_app/data_layer/data_source/remote/display_api.dart'
    as _i3;
import 'package:sample_app/data_layer/data_source/remote/place_holder_api_sample.dart'
    as _i7;
import 'package:sample_app/data_layer/repositoryImpl/display.repositoryImpl.dart'
    as _i5;
import 'package:sample_app/data_layer/repositoryImpl/place_holder.repositoryImpl.dart'
    as _i9;
import 'package:sample_app/domain_layer/repository/display.repository.dart'
    as _i4;
import 'package:sample_app/domain_layer/repository/place_holder.repository.dart'
    as _i8;
import 'package:sample_app/domain_layer/usecase/display.usecase.dart' as _i6;
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart'
    as _i10;
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart'
    as _i13;
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart'
    as _i12;
import 'package:sample_app/presentation_layer/user_page/bloc/user_bloc/user_bloc.dart'
    as _i11;

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
    gh.singleton<_i7.PlaceHolderApi>(apiModule.placeHolderApi);
    gh.singleton<_i8.PlaceHolderRepository>(
        _i9.PlaceHolderRepositoryImpl(gh<_i7.PlaceHolderApi>()));
    gh.singleton<_i10.PlaceHolderUsecase>(
        _i10.PlaceHolderUsecase(gh<_i8.PlaceHolderRepository>()));
    gh.factory<_i11.UserBloc>(
        () => _i11.UserBloc(gh<_i10.PlaceHolderUsecase>()));
    gh.factory<_i12.ViewModulesBloc>(
        () => _i12.ViewModulesBloc(gh<_i6.DisplayUsecase>()));
    gh.factory<_i13.CollectionsBloc>(
        () => _i13.CollectionsBloc(gh<_i6.DisplayUsecase>()));
    return this;
  }
}

class _$ApiModule extends _i14.ApiModule {}
