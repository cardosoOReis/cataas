import 'package:shell/layers/domain/usecases/get_tags/get_tags_usecase.dart';

import '../../domain/entities/cat_entity.dart';
import '../../domain/usecases/get_cat_amount/get_cat_amount_usecase.dart';
import '../../domain/usecases/get_cat_by_id/get_cat_by_id_usecase.dart';
import '../../domain/usecases/get_cat_by_id_with_params/get_cat_by_id_with_params_usecase.dart';
import '../../domain/usecases/get_random_cat/get_random_cat_usecase.dart';
import '../../domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase.dart';

class CatController {
  final GetRandomCatUsecase _getRandomCatUsecase;
  final GetCatByIdUsecase _getCatByIdUsecase;
  final GetRandomCatWithParamsUsecase _getRandomCatWithParamsUsecase;
  final GetCatAmountUsecase _getCatAmountUsecase;
  final GetCatByIdWithParamsUsecase _getCatByIdWithParamsUsecase;
  final GetTagsUsecase _getTagsUsecase;

  CatController(
    this._getRandomCatUsecase,
    this._getCatByIdUsecase,
    this._getRandomCatWithParamsUsecase,
    this._getCatAmountUsecase,
    this._getCatByIdWithParamsUsecase,
    this._getTagsUsecase,
  );

  Future<CatEntity> getRandomCat() async {
    return await _getRandomCatUsecase();
  }

  Future<CatEntity> getCatById(String id) async {
    return await _getCatByIdUsecase(id);
  }

  Future<CatEntity> getRandomCatWithParams(
      {String? text, String? textColor, String? tag, String? filter}) async {
    return await _getRandomCatWithParamsUsecase(
      text: text,
      textColor: textColor,
      tag: tag,
      filter: filter,
    );
  }

  Future<int> getCatAmount() async {
    return await _getCatAmountUsecase();
  }

  Future<CatEntity> getCatByIdWithParams({
    required String id,
    String? text,
    String? textColor,
    String? filter,
  }) async {
    return await _getCatByIdWithParamsUsecase(
      id: id,
      text: text,
      textColor: textColor,
      filter: filter,
    );
  }

  Future<List<String>> getTags() async {
    return await _getTagsUsecase();
  }
}
