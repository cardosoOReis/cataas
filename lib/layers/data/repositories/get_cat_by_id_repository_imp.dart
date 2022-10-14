import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/get_cat_by_id_repository.dart';
import '../datasources/get_cat_by_id_datasource.dart';

class GetCatByIdRepositoryImp implements GetCatByIdRepository {

  final GetCatByIdDatasource _getCatByIdDatasource;
  GetCatByIdRepositoryImp(this._getCatByIdDatasource);

  @override
  Future<CatEntity> call(String id) async {
    return await _getCatByIdDatasource(id);
  }
}
