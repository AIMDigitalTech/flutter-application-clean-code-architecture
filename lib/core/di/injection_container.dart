import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import '../../config/flavors.dart';
import '../../features/login/data/data_sources/login_local_datasource.dart';
import '../../features/login/data/data_sources/login_remote_datasource.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../bloc/network_cubit.dart';
import '../logger/firebase_logger.dart';
import '../network/network_client.dart';
import '../network/network_info.dart';
import '../network/pretty_dio_logger.dart';

final serviceLocator = GetIt.I;

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

final authHeader = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Accept': 'application/json',
  // 'responseType': 'ResponseType.json',
  // 'followRedirects': true,
};

Future<void> initDI() async {
  // TODO: SEPARATE REMOTE, CACHE, DOMAIN, DATA DEPENDENCIES

  Dio _dio = Dio();
  BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 5000),
      connectTimeout: const Duration(milliseconds: 5000),
      baseUrl: F.baseURL,
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      maxRedirects: 2);

  _dio.options = baseOptions;

  _dio.interceptors.clear();

  _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      request: true,
      compact: true,
      maxWidth: 90,
      requestHeader: true,
      responseBody: true,
      responseHeader: false));

  (_dio.transformer as BackgroundTransformer).jsonDecodeCallback = parseJson;

  _dio.interceptors
      .add(InterceptorsWrapper(onError: (DioException error, handler) {
    return handler.next(error);
  }, onRequest: (RequestOptions requestOptions, handler) async {
    return handler.next(requestOptions);
  }, onResponse: (response, handler) async {
    return handler.next(response);
  }));

  serviceLocator.registerLazySingleton(() => _dio);

  serviceLocator.registerFactory(() => NetworkCubit());

  // Firebase logger
  serviceLocator.registerLazySingleton(() => FirebaseLogger());

  // Database initialize.
  // serviceLocator.registerSingleton(() => openConnection());

  // Network Client.
  serviceLocator
      .registerLazySingleton(() => NetworkClient(dio: serviceLocator()));

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  if (!kIsWeb) {
    final connectionChecker = SimpleConnectionChecker()
      ..setLookUpAddress('pub.dev');

    serviceLocator.registerLazySingleton<SimpleConnectionChecker>(
        () => connectionChecker);
  }

  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // DATA SOURCES
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(networkClient: serviceLocator()));

  serviceLocator.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  // REPOSITORIES
  serviceLocator.registerLazySingleton<LoginRepository>(() =>
      LoginRepositoryImpl(
          networkInfoImpl: serviceLocator(),
          loginLocalDataSourceImpl: serviceLocator(),
          loginRemoteDataSourceImpl: serviceLocator()));

  // // BLOC
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(loginRepository: serviceLocator()));

  // USE CASES

  // DATA SOURCES

  // REPOSITORIES

  // USE CASES

  // BLOC
}
