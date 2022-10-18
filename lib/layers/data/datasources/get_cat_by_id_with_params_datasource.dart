import '../../domain/entities/cat_entity.dart';

abstract class GetCatByIdWithParamsDatasource {
  Future<CatEntity> call({
    required String id,
    String? text,
    String? textColor,
    String? filter,
  });
}
