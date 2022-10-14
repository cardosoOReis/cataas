import '../../entities/cat_entity.dart';
import '../../repositories/get_random_cat_repository.dart';
import 'get_random_cat_usecase.dart';

class GetRandomCatUsecaseImp implements GetRandomCatUsecase {
  final GetRandomCatRepository _getRandomCatRepository;
  GetRandomCatUsecaseImp(
    this._getRandomCatRepository,
  );

  @override
  Future<CatEntity> call() async {
    return await _getRandomCatRepository();
  }
}
