import '../dto/cat_dto.dart';

abstract class GetRandomCatDatasource {
  Future<CatDto> call();
}
