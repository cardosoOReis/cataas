import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/cat.dart';
import '../../domain/repositories/i_cat_repository.dart';
import '../../presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../../presentation/usecases/i_save_cat_locally_usecase.dart';
import '../../presentation/usecases/i_share_cat_usecase.dart';
import '../datasources/i_cat_local_datasource.dart';
import '../datasources/i_cat_remote_datasource.dart';
import '../models/cat_model.dart';

class CatRepositoryImpl implements ICatRepository {
  final ICatRemoteDatasource _remoteDatasource;
  final ICatLocalDatasource _localDatasource;
  final INetworkInfo _networkInfo;
  const CatRepositoryImpl({
    required ICatRemoteDatasource remoteDatasource,
    required ICatLocalDatasource localDatasource,
    required INetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, Cat>> getCatById(
    GetCatByIdUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getCatById(params));
  }

  @override
  Future<Either<Failure, Cat>> getCatByTag(
    GetCatByTagUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getCatByTag(params));
  }

  @override
  Future<Either<Failure, Cat>> getRandomCat(
    GetRandomCatUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getRandomCat(params));
  }

  @override
  Future<Either<Failure, Cat>> getCatByIdOrTag(
    GetCatByIdOrTagUsecaseParams params,
  ) async {
    return await _getCat(() => _remoteDatasource.getCatByIdOrTag(params));
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

  Future<Either<Failure, Cat>> _getCat<Params>(
    Future<CatModel> Function() getCat,
  ) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NoInternetConnectionFailure());
    }

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
  }

  @override
  Future<Either<Failure, void>> shareCat(ShareCatUsecaseParams params) async {
    try {
      final result = await _remoteDatasource.shareCat(params);

      return Right(result);
    } on ShareCatException {
      return const Left(ShareCatFailure());
    }
  }
}
