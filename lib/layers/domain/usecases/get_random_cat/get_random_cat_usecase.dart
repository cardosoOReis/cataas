import '../../entities/cat_entity.dart';

abstract class GetRandomCatUsecase {
  Future<CatEntity> call();
}
