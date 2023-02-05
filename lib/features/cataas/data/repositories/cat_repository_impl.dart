// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/platform/i_network_info.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';

class CatRepositoryImpl implements ICatRepository {
  final ICatRemoteDatasource remoteDatasource;
  final INetworkInfo networkInfo;
  CatRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CatEntity>> getCatById(
    GetCatByIdUsecaseParams params,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatasource.getCatById(params);

        return Right(result);
      } on CatNotFoundException catch (e) {
        return Left(ApiFailure(exception: e));
      } on ParseDataException catch (e) {
        return Left(ParseDataFailure(exception: e));
      } catch (_) {
        rethrow;
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, CatEntity>> getCatByTag(
      GetCatByTagUsecaseParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatasource.getCatByTag(params);

        return Right(result);
      } on CatNotFoundException catch (e) {
        return Left(ApiFailure(exception: e));
      } on ParseDataException catch (e) {
        return Left(ParseDataFailure(exception: e));
      } catch (_) {
        rethrow;
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, CatEntity>> getRandomCat(
    GetRandomCatUsecaseParams params,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatasource.getRandomCat(params);

        return Right(result);
      } on CatNotFoundException catch (e) {
        return Left(ApiFailure(exception: e));
      } on ParseDataException catch (e) {
        return Left(ParseDataFailure(exception: e));
      } catch (_) {
        rethrow;
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
