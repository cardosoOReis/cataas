import '../entities/cat_entity.dart';

abstract class GetCatByIdWithParamsRepository {
  Future<CatEntity> call({
    required String id,
    String? text,
    String? textColor,
    String? filter,
  });
}
