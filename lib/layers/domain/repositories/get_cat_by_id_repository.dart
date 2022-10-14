import '../entities/cat_entity.dart';

abstract class GetCatByIdRepository {
  Future<CatEntity> call(String id);
}
