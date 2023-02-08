import '../../domain/usecases/get_cat_by_id_usecase.dart';
import '../../domain/usecases/get_cat_by_tag_usecase.dart';
import '../../domain/usecases/get_random_cat_usecase.dart';
import '../models/cat_model.dart';

abstract class ICatRemoteDatasource {
  Future<CatModel> getRandomCat(
    GetRandomCatUsecaseParams params,
  );
  Future<CatModel> getCatById(
    GetCatByIdUsecaseParams params,
  );
  Future<CatModel> getCatByTag(
    GetCatByTagUsecaseParams params,
  );
}
