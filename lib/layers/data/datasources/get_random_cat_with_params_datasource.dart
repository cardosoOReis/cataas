import '../dto/cat_dto.dart';

abstract class GetRandomCatWithParamsDatasource {
  Future<CatDto> call({
    String? text,
    String? tag,
    String? textColor,
    String? filter,
  });
}
