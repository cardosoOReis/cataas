import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/get_random_cat_repository.dart';
import '../datasources/get_random_cat_datasource.dart';

class GetRandomCatRepositoryImp implements GetRandomCatRepository {

  final GetRandomCatDatasource _getRandomCatDatasource;
  GetRandomCatRepositoryImp(this._getRandomCatDatasource);

  @override
  Future<CatEntity> call() async {
    return await _getRandomCatDatasource();
  }
}
