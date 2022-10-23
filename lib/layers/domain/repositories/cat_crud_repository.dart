import '../entities/cat_entity.dart';

abstract class CatCrudRepository {
  Future<CatEntity> create(CatEntity catEntity);

  Future<CatEntity?> retrieve(String id);

  Future<CatEntity> update(String id);

  Future<void> delete(String id);

  Future<List<CatEntity>?> retrieveAll();
}
