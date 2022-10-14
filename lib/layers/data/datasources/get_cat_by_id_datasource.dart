import '../dto/cat_dto.dart';

abstract 
class GetCatByIdDatasource {
  Future<CatDto> call(String id);
}