import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/get_random_cat_with_params_repository.dart';
import '../datasources/get_random_cat_with_params_datasource.dart';

class GetRandomCatWithParamsRepositoryImp
    implements GetRandomCatWithParamsRepository {
  final GetRandomCatWithParamsDatasource _getRandomCatWithParamsDatasource;
  GetRandomCatWithParamsRepositoryImp(
    this._getRandomCatWithParamsDatasource,
  );

  @override
  Future<CatEntity> call(
      {String? text, String? tag, String? textColor, String? filter}) async {
    return await _getRandomCatWithParamsDatasource.call(
      text: text,
      tag: tag,
      textColor: textColor,
      filter: filter,
    );
  }
}
