import '../../entities/cat_entity.dart';

abstract class GetCatByIdWithParamsUsecase {
  Future<CatEntity> call(
    String id,
    String? text,
    String? textColor,
    String? filter,
  );
}
