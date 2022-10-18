import '../../entities/cat_entity.dart';

abstract class GetRandomCatWithParamsUsecase {
  Future<CatEntity> call(
      {String? text, String? tag, String? textColor, String? filter});
}
