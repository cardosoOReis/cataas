import '../../entities/cat_entity.dart';
import '../../repositories/get_cat_by_id_repository.dart';
import 'get_cat_by_id_usecase.dart';

class GetCatByIdUsecaseImp implements GetCatByIdUsecase {

  final GetCatByIdRepository _getCatByIdRepository;

  GetCatByIdUsecaseImp(this._getCatByIdRepository);

  @override
  Future<CatEntity> call(String id) async {
    return await _getCatByIdRepository(id);
  }
}
