import 'package:dio/dio.dart';
import 'package:front_end/modules/auth/data/datasource/auth_datasource.dart';
import 'package:front_end/modules/auth/presenter/store/sign_in_store.dart';
import 'package:get_it/get_it.dart';

import '../../../modules/auth/data/datasource/auth_datasouce_impl.dart';
import '../../../modules/auth/data/repositories/sign_in_repository_impl.dart';
import '../../../modules/auth/domain/repositories/auth_repository.dart';
import '../../../modules/auth/domain/use_cases/sign_in_use_case.dart';
import '../../../modules/home/data/datasource/home_datasource.dart';
import '../../../modules/home/data/datasource/home_datasource_impl.dart';
import '../../../modules/home/data/repositories/home_repository_impl.dart';
import '../../../modules/home/domain/repositories/home_repository.dart';
import '../../../modules/home/domain/use_cases/get_clients_list_use_case.dart';
import '../../../modules/home/domain/use_cases/get_statistics_daily_sales_use_case.dart';
import '../../../modules/home/domain/use_cases/get_statistics_highlights_use_case.dart';
import '../../../modules/home/domain/use_cases/register_client_use_case.dart';
import '../../../modules/home/domain/use_cases/register_sale_use_case.dart';
import '../../../modules/home/presenter/store/home_store.dart';
import '../http/http_client.dart';
import '../local_storage/auth_token_storage.dart';

final getIt = GetIt.instance;

void setup() {
  // DIO
  getIt.registerLazySingleton<Dio>(() => dioHttpClient());

  // Local Storage
  getIt.registerLazySingleton<AuthTokenStorage>(() => AuthTokenStorage());

  // Auth module
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasouceImpl());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  getIt.registerFactory<SignInStore>(() => SignInStore());

  // Home module
  getIt.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  getIt.registerLazySingleton<RegisterSaleUseCase>(() => RegisterSaleUseCase());
  getIt.registerLazySingleton<RegisterClientUseCase>(
    () => RegisterClientUseCase(),
  );
  getIt.registerLazySingleton<GetClientsListUseCase>(
    () => GetClientsListUseCase(),
  );
  getIt.registerLazySingleton<GetStatisticsDailySalesUseCase>(
    () => GetStatisticsDailySalesUseCase(),
  );
  getIt.registerLazySingleton<GetStatisticsHighlightsUseCase>(
    () => GetStatisticsHighlightsUseCase(),
  );
  getIt.registerFactory<HomeStore>(() => HomeStore());
}
