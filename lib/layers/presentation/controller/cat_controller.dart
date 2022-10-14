import 'package:shell/layers/domain/usecases/get_cat_amount/get_cat_amount_usecase.dart';
import 'package:shell/layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase.dart';

import '../../domain/entities/cat_entity.dart';
import '../../domain/usecases/get_cat_by_id/get_cat_by_id_usecase.dart';
import '../../domain/usecases/get_random_cat/get_random_cat_usecase.dart';

class CatController {
  final GetRandomCatUsecase _getRandomCatUsecase;
  final GetCatByIdUsecase _getCatByIdUsecase;
  final GetRandomCatWithParamsUsecase _getRandomCatWithParamsUsecase;
  final GetCatAmountUsecase _getCatAmountUsecase;

  CatController(
    this._getRandomCatUsecase,
    this._getCatByIdUsecase,
    this._getRandomCatWithParamsUsecase,
    this._getCatAmountUsecase,
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
}
