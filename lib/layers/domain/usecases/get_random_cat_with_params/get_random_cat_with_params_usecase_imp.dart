import '../../entities/cat_entity.dart';
import '../../repositories/get_random_cat_with_params_repository.dart';
import 'get_random_cat_with_params_usecase.dart';

class GetRandomCatWithParamsUsecaseImp
    implements GetRandomCatWithParamsUsecase {
  final GetRandomCatWithParamsRepository _getRandomCatWithParamsRepository;
  GetRandomCatWithParamsUsecaseImp(this._getRandomCatWithParamsRepository);

  @override
  Future<CatEntity> call(
      {String? text, String? tag, String? textColor, String? filter}) async {
    return await _getRandomCatWithParamsRepository(
      text: text,
      tag: tag,
      textColor: textColor,
      filter: filter,
    );
  }
}
