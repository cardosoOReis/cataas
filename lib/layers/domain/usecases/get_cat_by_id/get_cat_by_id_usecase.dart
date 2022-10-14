import '../../entities/cat_entity.dart';

abstract class GetCatByIdUsecase {
  Future<CatEntity> call(String id);
}
