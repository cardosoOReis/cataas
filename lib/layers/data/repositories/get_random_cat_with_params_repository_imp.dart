// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shell/layers/data/datasources/get_random_cat_with_params_datasource.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/repositories/get_random_cat_with_params_repository.dart';

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
