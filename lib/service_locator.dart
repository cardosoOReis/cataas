import 'package:cataas/features/cataas/domain/usecases/save_cat_locally_usecase_impl.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_save_cat_locally_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/i_network_info.dart';
import 'core/network/network_info_impl.dart';
import 'core/services/i_save_image_locally_service.dart';
import 'core/services/save_image_locally_service_impl.dart';
import 'features/cataas/data/datasources/i_cat_local_datasource.dart';
import 'features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'features/cataas/data/datasources/implementations/cat_local_datasource_impl.dart';
import 'features/cataas/data/datasources/implementations/cat_remote_datasource_impl.dart';
import 'features/cataas/data/repositories/cat_repository_impl.dart';
import 'features/cataas/domain/repositories/i_cat_repository.dart';
import 'features/cataas/domain/usecases/get_cat_by_id_usecase_impl.dart';
import 'features/cataas/domain/usecases/get_cat_by_tag_usecase_impl.dart';
import 'features/cataas/domain/usecases/get_random_cat_usecase_impl.dart';
import 'features/cataas/presentation/cubits/cat_cubit.dart';
import 'features/cataas/presentation/usecases/i_get_cat_by_id_usecase.dart';
import 'features/cataas/presentation/usecases/i_get_cat_by_tag_usecase.dart';
import 'features/cataas/presentation/usecases/i_get_random_cat_usecase.dart';

final sl = GetIt.instance;

void initServices() {
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
  sl.registerFactory<IGetRandomCatUsecase>(
    () => GetRandomCatUsecaseImpl(sl()),
  );
  sl.registerFactory<IGetCatByIdUsecase>(
    () => GetCatByIdUsecaseImpl(sl()),
  );
  sl.registerFactory<IGetCatByTagUsecase>(
    () => GetCatByTagUsecaseImpl(sl()),
  );
  sl.registerFactory<ISaveCatLocallyUsecase>(
    () => SaveCatLocallyUsecaseImpl(sl()),
  );
}
