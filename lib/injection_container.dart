import 'package:clean_architcture_islam/core/api/api_consumer.dart';
import 'package:clean_architcture_islam/core/api/app_interceptor.dart';
import 'package:clean_architcture_islam/core/api/dio_consumer.dart';
import 'package:clean_architcture_islam/core/netwok/network_info.dart';
import 'package:clean_architcture_islam/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:clean_architcture_islam/features/random_quote/data/datasources/random_quote_remote_datasource.dart';
import 'package:clean_architcture_islam/features/random_quote/data/repositories/quote_repo_impl.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:clean_architcture_islam/features/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:clean_architcture_islam/features/splash/data/date_source/lang_local_data_source.dart';
import 'package:clean_architcture_islam/features/splash/data/repository/lang_repository_impl.dart';
import 'package:clean_architcture_islam/features/splash/domain/repository/lang_repository.dart';
import 'package:clean_architcture_islam/features/splash/domain/usecases/change_lang.dart';
import 'package:clean_architcture_islam/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:clean_architcture_islam/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///// features
  //// Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));

  /// Use Cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRapository: sl()));
  sl.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(langRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));

  //// Repository
  sl.registerLazySingleton<QuoteRepoisitory>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteLocalDataSource: sl(),
      randomQuoteRandomDataSource: sl()));
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocaleDataSource: sl()));

  /// Data source
  sl.registerLazySingleton<GetRandomQuoteLocalDataSource>(
      () => GetRandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<GetRandomQuoteRemoteDataSource>(
      () => GetRandomQuoteRemoteDataSourceImpl(dioConsumer: sl()));
  sl.registerLazySingleton<LangLocaleDataSource>(
      () => LangLocaleDataSourceImpl(sharedPreferences: sl()));

  /// core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        error: true,
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
