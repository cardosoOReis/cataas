import 'package:cataas/features/cataas/presentation/usecases/i_share_cat_usecase.dart';

import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
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
  Future<void> shareCat(
    ShareCatUsecaseParams params,
  );
}
