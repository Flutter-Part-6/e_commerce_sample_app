import 'package:get_it/get_it.dart';

/// dio
import 'data_layer/common/dio/rest_client.dart';

/// place_holder
/// api
import 'package:sample_app/data_layer/data_source/remote/place_holder_api_sample.dart';

/// repository
import 'package:sample_app/data_layer/repositoryImpl/place_holder.repositoryImpl.dart';
import 'package:sample_app/domain_layer/repository/place_holder.repository.dart';

/// usecase
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';

/// bloc
import 'presentation_layer/user_page_sample/bloc/user_page_sample_bloc.dart';

/// display
/// api
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

/// repository
import 'package:sample_app/domain_layer/repository/display.repository.dart';
import 'package:sample_app/data_layer/repositoryImpl/display.repositoryImpl.dart';

/// usecase
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

/// bloc
import 'presentation_layer/home_page/bloc/home_page_bloc.dart';

final serviceLocator = GetIt.instance;

Function registerSingleton = serviceLocator.registerSingleton;
Function registerFactory = serviceLocator.registerFactory;

void initDependencyInjection() {
  _dataLayer();
  _domainLayer();
  _presentationLayer();
}

void _dataLayer() {
  // dio
  final dio = RestClient().getDio;

  // data_source
  // place_holder_api
  registerSingleton<PlaceHolderApi>(PlaceHolderApi(dio));

  DisplayApi dataSource = DisplayApi(dio);
  // DisplayApi dataSource = DisplayApi.mock();

  // display_api
  registerSingleton<DisplayApi>(dataSource);
}

void _domainLayer() {
  // ------ repository ------
  // place_holder
  registerSingleton<PlaceHolderRepository>(
      PlaceHolderRepositoryImpl(serviceLocator<PlaceHolderApi>()));
  // display
  registerSingleton<DisplayRepository>(
      DisplayRepositoryImpl(serviceLocator<DisplayApi>()));

  // ------ usecase ------
  // place_holder
  registerSingleton<PlaceHolderUsecase>(
    PlaceHolderUsecase(serviceLocator<PlaceHolderRepository>()),
  );
  // display
  registerSingleton<DisplayUsecase>(
      DisplayUsecase(serviceLocator<DisplayRepository>()));
}

void _presentationLayer() {
  //bloc
  // place_holder - user
  registerFactory<UserBloc>(
      () => UserBloc(serviceLocator<PlaceHolderUsecase>()));

  // display - home_page
  // collections
  registerFactory<CollectionsBloc>(
      () => CollectionsBloc(serviceLocator<DisplayUsecase>()));
  // view_modules
  registerFactory<ViewModulesBloc>(
      () => ViewModulesBloc(serviceLocator<DisplayUsecase>()));
}
