import '../entities/cat_entity.dart';

abstract class GetRandomCatWithParamsRepository {
  Future<CatEntity> call(
      {String? text, String? tag, String? textColor, String? filter});
}
