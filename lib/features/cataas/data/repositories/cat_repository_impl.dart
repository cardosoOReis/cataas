import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/i_cat_repository.dart';
import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../../presentation/usecases/i_save_cat_locally_usecase.dart';
import '../datasources/i_cat_local_datasource.dart';
import '../datasources/i_cat_remote_datasource.dart';
import '../models/cat_model.dart';

class CatRepositoryImpl implements ICatRepository {
  final ICatRemoteDatasource _remoteDatasource;
  final ICatLocalDatasource _localDatasource;
  final INetworkInfo _networkInfo;
  CatRepositoryImpl({
    required ICatRemoteDatasource remoteDatasource,
    required ICatLocalDatasource localDatasource,
    required INetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, CatEntity>> getCatById(
    GetCatByIdUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getCatById(params));
  }

  @override
  Future<Either<Failure, CatEntity>> getCatByTag(
    GetCatByTagUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getCatByTag(params));
  }

  @override
  Future<Either<Failure, CatEntity>> getRandomCat(
    GetRandomCatUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getRandomCat(params));
  }

  @override
  Future<Either<Failure, void>> saveCatLocally(
    SaveCatLocallyUsecaseParams params,
  ) async {
    try {
      final result = await _localDatasource.saveCatLocally(params);

      return Right(result);
    } on SaveCatLocallyException catch (e) {
      return Left(SaveCatLocallyFailure(exception: e));
    }
  }

  Future<Either<Failure, CatEntity>> _getCat<Params>(
    Future<CatModel> Function() getCat,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await getCat();

        return Right(result);
      } on CatNotFoundException catch (e) {
        return Left(ApiFailure(exception: e));
      } on ParseDataException catch (e) {
        return Left(ParseDataFailure(exception: e));
      } on ServerException catch (e) {
        return Left(ServerFailure(exception: e));
      } catch (_) {
        rethrow;
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
