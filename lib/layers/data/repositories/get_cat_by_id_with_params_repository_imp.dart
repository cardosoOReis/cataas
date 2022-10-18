import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/get_cat_by_id_with_params_repository.dart';
import '../datasources/get_cat_by_id_with_params_datasource.dart';

class GetCatByIdWithParamsRepositoryImp
    implements GetCatByIdWithParamsRepository {
  final GetCatByIdWithParamsDatasource _getCatByIdWithParamsDatasource;
  GetCatByIdWithParamsRepositoryImp(this._getCatByIdWithParamsDatasource);

  @override
  Future<CatEntity> call(
      {required String id,
      String? text,
      String? textColor,
      String? filter}) async {
    return await _getCatByIdWithParamsDatasource(
      id: id,
      text: text,
      textColor: textColor,
      filter: filter,
    );
  }
}
