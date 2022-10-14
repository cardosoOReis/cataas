import '../entities/cat_entity.dart';

abstract class GetRandomCatRepository {
  Future<CatEntity> call();
}
