import '../../domain/entities/cat_entity.dart';
import '../dto/cat_dto.dart';

abstract class CatCrudDatasource {
  Future<CatDto> create(CatEntity catEntity);

  Future<CatDto?> retrieve(String id);

  Future<CatDto> update(String id);

  Future<void> delete(String id);

  Future<List<CatDto>?> retrieveAll();
}
