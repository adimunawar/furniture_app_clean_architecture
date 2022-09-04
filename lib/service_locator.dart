import 'package:e_furniture/core/bloc/app_level_bloc.dart';
import 'package:e_furniture/core/network/network_info.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:e_furniture/features/authentication/data/repositories_impl/auth_repository_impl.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:e_furniture/features/authentication/domain/use_case/login_user_with_username_use_case.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/helpers/http_request_helper.dart';

final locator = GetIt.instance;
Future<void> init() async {
  //features
  //bloc
  locator.registerFactory(() => AuthenticationBloc(locator()));
  locator.registerFactory(() => AppLevelBloc(locator()));

  //useCases
  locator.registerLazySingleton(() => LoginWithUsernamePassword(locator()));

  //repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      localDatasource: locator(),
      remoteDataSource: locator(),
      networkInfo: locator()));

  //data source
  locator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(server: locator()));

  //External
  SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => prefs);
  locator.registerLazySingleton(() => InternetConnectionChecker());

  //core
  locator
      .registerLazySingleton<HttpRequestHelper>(() => HttpRequestHelperImpl());
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: locator()));
}
