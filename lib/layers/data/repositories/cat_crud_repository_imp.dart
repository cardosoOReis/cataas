import 'package:shell/layers/data/datasources/cat_crud_datasource.dart';
import 'package:shell/layers/data/dto/cat_dto.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/repositories/cat_crud_repository.dart';

class CatCrudRepositoryImp implements CatCrudRepository {
  final CatCrudDatasource _catCrudDatasource;
  CatCrudRepositoryImp(this._catCrudDatasource);

  @override
  Future<CatDto> create(CatEntity catEntity) async {
    return await _catCrudDatasource.create(catEntity);
  }

  @override
  Future<CatDto?> retrieve(String id) async {
    return await _catCrudDatasource.retrieve(id);
  }

  @override
  Future<CatDto> update(String id) async {
    return await _catCrudDatasource.update(id);
  }

  @override
  Future<void> delete(String id) async {
    await _catCrudDatasource.delete(id);
  }

  @override
  Future<List<CatEntity>?> retrieveAll() async {
    return await _catCrudDatasource.retrieveAll();
  }
}
