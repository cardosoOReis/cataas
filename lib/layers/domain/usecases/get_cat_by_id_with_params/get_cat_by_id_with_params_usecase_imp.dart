import '../../entities/cat_entity.dart';
import '../../repositories/get_cat_by_id_with_params_repository.dart';
import 'get_cat_by_id_with_params_usecase.dart';

class GetCatByIdWithParamsUsecaseImp implements GetCatByIdWithParamsUsecase {
  final GetCatByIdWithParamsRepository _getCatByIdWithParamsRepository;

  GetCatByIdWithParamsUsecaseImp(this._getCatByIdWithParamsRepository);

  @override
  Future<CatEntity> call({
    required String id,
    String? text,
    String? textColor,
    String? filter,
  }) async {
    return await _getCatByIdWithParamsRepository(
      id: id,
      text: text,
      textColor: textColor,
      filter: filter,
    );
  }
}
