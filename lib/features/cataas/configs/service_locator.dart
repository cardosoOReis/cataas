import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/network/i_network_info.dart';
import '../../../core/network/network_info_impl.dart';
import '../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../core/services/open_url_on_browser/open_url_on_browser_service_impl.dart';
import '../../../core/services/save_image_locally/i_save_image_locally_service.dart';
import '../../../core/services/save_image_locally/save_image_locally_service_impl.dart';
import '../../../core/services/share_image/i_share_image_service.dart';
import '../../../core/services/share_image/share_image_service_impl.dart';
import '../data/datasources/i_cat_local_datasource.dart';
import '../data/datasources/i_cat_remote_datasource.dart';
import '../data/datasources/implementations/cat_local_datasource_impl.dart';
import '../data/datasources/implementations/cat_remote_datasource_impl.dart';
import '../data/repositories/cat_repository_impl.dart';
import '../domain/repositories/i_cat_repository.dart';
import '../domain/usecases/get_cat_by_id_or_tag_usecase_impl.dart';
import '../domain/usecases/get_cat_by_id_usecase_impl.dart';
import '../domain/usecases/get_cat_by_tag_usecase_impl.dart';
import '../domain/usecases/get_random_cat_usecase_impl.dart';
import '../domain/usecases/save_cat_locally_usecase_impl.dart';
import '../domain/usecases/share_cat_usecase_impl.dart';
import '../presentation/atomic/atoms/show_toast_atom/i_show_toast_atom.dart';
import '../presentation/atomic/atoms/show_toast_atom/show_toast_atom_impl.dart';
import '../presentation/cubits/cat_cubit.dart';
import '../presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../presentation/usecases/i_get_random_cat_usecase.dart';
import '../presentation/usecases/i_save_cat_locally_usecase.dart';
import '../presentation/usecases/i_share_cat_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void initServices() {
    // Core
    // Network
    sl
      ..registerLazySingleton<INetworkInfo>(
        () => NetworkInfoImpl(
          connectionChecker: InternetConnectionChecker(),
        ),
      )
      // Services
      ..registerLazySingleton<ISaveImageLocallyService>(
        () => const SaveImageLocallyServiceImpl(),
      )
      ..registerLazySingleton<IOpenUrlOnBrowserService>(
        () => const OpenUrlOnBrowserServiceImpl(),
      )
      ..registerLazySingleton<IShareImageService>(
        ShareImageServiceImpl.new,
      )

      // Feature/CatAAS
      // Cubits
      ..registerFactory<CatCubit>(
        () => CatCubit(
          getRandomCatUsecase: sl<IGetRandomCatUsecase>(),
          getCatByIdOrTagUsecase: sl<IGetCatByIdOrTagUsecase>(),
        ),
      )

      // Datasources
      ..registerLazySingleton<ICatRemoteDatasource>(
        () => CatRemoteDatasourceImpl(
          client: Dio(),
          shareImageService: sl<IShareImageService>(),
        ),
      )
      ..registerLazySingleton<ICatLocalDatasource>(
        () => CatLocalDatasourceImpl(
          service: sl<ISaveImageLocallyService>(),
        ),
      )

      // Repositories
      ..registerLazySingleton<ICatRepository>(
        () => CatRepositoryImpl(
          remoteDatasource: sl<ICatRemoteDatasource>(),
          localDatasource: sl<ICatLocalDatasource>(),
          networkInfo: sl<INetworkInfo>(),
        ),
      )

      // Usecases
      ..registerLazySingleton<IGetRandomCatUsecase>(
        () => GetRandomCatUsecaseImpl(sl<ICatRepository>()),
      )
      ..registerLazySingleton<IGetCatByIdUsecase>(
        () => GetCatByIdUsecaseImpl(sl<ICatRepository>()),
      )
      ..registerLazySingleton<IGetCatByTagUsecase>(
        () => GetCatByTagUsecaseImpl(sl<ICatRepository>()),
      )
      ..registerLazySingleton<IGetCatByIdOrTagUsecase>(
        () => GetCatByIdOrTagUsecaseImpl(sl<ICatRepository>()),
      )
      ..registerLazySingleton<ISaveCatLocallyUsecase>(
        () => SaveCatLocallyUsecaseImpl(sl<ICatRepository>()),
      )
      ..registerLazySingleton<IShareCatUsecase>(
        () => ShareCatUsecaseImpl(sl<ICatRepository>()),
      )

      // Atoms
      ..registerLazySingleton<IShowToastAtom>(
        ShowToastAtomImpl.new,
      );
  }
}
