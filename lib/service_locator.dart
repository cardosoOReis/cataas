import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/core/network/network_info_impl.dart';
import 'package:cataas/core/services/i_save_image_locally_service.dart';
import 'package:cataas/core/services/save_image_locally_service_impl.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_local_datasource.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/datasources/implementations/cat_local_datasource_impl.dart';
import 'package:cataas/features/cataas/data/datasources/implementations/cat_remote_datasource_impl.dart';
import 'package:cataas/features/cataas/data/repositories/cat_repository_impl.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> initServices() async {
  // Core
  // Network
  sl.registerLazySingleton<INetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: InternetConnectionChecker(),
    ),
  );
  // Services
  sl.registerLazySingleton<ISaveImageLocallyService>(
    () => SaveImageLocallyServiceImpl(),
  );

  // Feature/CatAAS
  // Cubits
  sl.registerFactory<CatCubit>(
    () => CatCubit(
      getRandomCatUsecase: sl(),
      getCatByIdUsecase: sl(),
      getCatByTagUsecase: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<ICatRemoteDatasource>(
    () => CatRemoteDatasourceImpl(
      client: Dio(),
    ),
  );
  sl.registerLazySingleton<ICatLocalDatasource>(
    () => CatLocalDatasourceImpl(
      service: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<ICatRepository>(
    () => CatRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(() => GetRandomCatUsecaseImpl(sl()));
  sl.registerLazySingleton(() => GetCatByIdUsecase(sl()));
  sl.registerLazySingleton(() => GetCatByTagUsecase(sl()));
}
