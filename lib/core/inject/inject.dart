import 'package:get_it/get_it.dart';

import '../../layers/data/datasources/get_cat_amount_datasource.dart';
import '../../layers/data/datasources/get_cat_by_id_datasource.dart';
import '../../layers/data/datasources/get_random_cat_datasource.dart';
import '../../layers/data/datasources/get_random_cat_with_params_datasource.dart';
import '../../layers/data/datasources/remote/default_get_cat_amount_datasource_imp.dart';
import '../../layers/data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import '../../layers/data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import '../../layers/data/datasources/remote/default_get_random_cat_with_params_datasource_imp.dart';
import '../../layers/data/repositories/get_cat_amount_repository_imp.dart';
import '../../layers/data/repositories/get_cat_by_id_repository_imp.dart';
import '../../layers/data/repositories/get_random_cat_repository_imp.dart';
import '../../layers/data/repositories/get_random_cat_with_params_repository_imp.dart';
import '../../layers/domain/repositories/get_cat_amount_repository.dart';
import '../../layers/domain/repositories/get_cat_by_id_repository.dart';
import '../../layers/domain/repositories/get_random_cat_repository.dart';
import '../../layers/domain/repositories/get_random_cat_with_params_repository.dart';
import '../../layers/domain/usecases/get_cat_amount/get_cat_amount_usecase.dart';
import '../../layers/domain/usecases/get_cat_amount/get_cat_amount_usecase_imp.dart';
import '../../layers/domain/usecases/get_cat_by_id/get_cat_by_id_usecase.dart';
import '../../layers/domain/usecases/get_cat_by_id/get_cat_by_id_usecase_imp.dart';
import '../../layers/domain/usecases/get_random_cat/get_random_cat_usecase.dart';
import '../../layers/domain/usecases/get_random_cat/get_random_cat_usecase_imp.dart';
import '../../layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase.dart';
import '../../layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase_imp.dart';
import '../../layers/presentation/controller/cat_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<GetCatByIdDatasource>(
        () => DefaultGetCatByIdDatasourceImp());
    getIt.registerLazySingleton<GetRandomCatDatasource>(
        () => DefaultGetRandomCatDatasourceImp());
    getIt.registerLazySingleton<GetRandomCatWithParamsDatasource>(
        () => DefaultGetRandomCatWithParamsDatasourceImp());
    getIt.registerLazySingleton<GetCatAmountDatasource>(
        () => DefaultGetCatAmountDatasourceImp());
    // repositories
    getIt.registerLazySingleton<GetCatByIdRepository>(
        () => GetCatByIdRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetRandomCatRepository>(
        () => GetRandomCatRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetRandomCatWithParamsRepository>(
        () => GetRandomCatWithParamsRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetCatAmountRepository>(
        () => GetCatAmountRepositoryImp(getIt()));
    // usecases
    getIt.registerLazySingleton<GetCatByIdUsecase>(
        () => GetCatByIdUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetRandomCatUsecase>(
        () => GetRandomCatUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetRandomCatWithParamsUsecase>(
        () => GetRandomCatWithParamsUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetCatAmountUsecase>(
        () => GetCatAmountUsecaseImp(getIt()));
    // controller
    getIt.registerFactory<CatController>(
        () => CatController(getIt(), getIt(), getIt(), getIt()));
  }
}
