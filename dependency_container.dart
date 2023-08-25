import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sb_myreports/features/complaint_managemnt/presentation/manager/complain_provider.dart';
import 'package:sb_myreports/features/dashboard/manager/dashboard_provider.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';
import 'features/authentication/data/data_sources/login_remote_data_source.dart';
import 'features/authentication/data/repository/auth_repo_imp.dart';
import 'features/authentication/domain/repository/auth_repo.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'features/authentication/presentation/manager/auth_provider.dart';
import 'features/flight1/presentation/provider/flight_info_provider.dart';
import 'features/promotion/presentation/manager/promotion_provider.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dio: sl()));

  //Data sources
  sl.registerLazySingleton<AuthRepository>(
      () => LoginRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  /// Configs

  /// Repository

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Providers
  ///
  sl.registerLazySingleton(() => AuthProvider(sl()));
  sl.registerLazySingleton(() => FlightInfoProvider());
  sl.registerLazySingleton(() => ComplainProvider());
  sl.registerLazySingleton(() => DashboardProvider());

  sl.registerLazySingleton(() => PromotionProvider());
  sl.registerLazySingleton(() => Dio());

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
