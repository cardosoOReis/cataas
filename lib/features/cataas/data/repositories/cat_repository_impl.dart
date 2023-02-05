import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../datasources/i_cat_remote_datasource.dart';
import '../models/cat_model.dart';
import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/i_cat_repository.dart';
import '../../domain/usecases/get_cat_by_id_usecase.dart';
import '../../domain/usecases/get_cat_by_tag_usecase.dart';
import '../../domain/usecases/get_random_cat_usecase.dart';
import 'package:dartz/dartz.dart';

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
    return await _getCat(() => remoteDatasource.getCatById(params));
  }

  @override
  Future<Either<Failure, CatEntity>> getCatByTag(
      GetCatByTagUsecaseParams params) async {
    return await _getCat(() => remoteDatasource.getCatByTag(params));
  }

  @override
  Future<Either<Failure, CatEntity>> getRandomCat(
    GetRandomCatUsecaseParams params,
  ) async {
    return await _getCat(() => remoteDatasource.getRandomCat(params));
  }

  Future<Either<Failure, CatEntity>> _getCat<Params>(
      Future<CatModel> Function() getCat) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await getCat();

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
