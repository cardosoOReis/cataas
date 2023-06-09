import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../../presentation/usecases/i_save_cat_locally_usecase.dart';
import '../../presentation/usecases/i_share_cat_usecase.dart';
import '../entities/cat.dart';

abstract class ICatRepository {
  Future<Either<Failure, Cat>> getRandomCat(
    GetRandomCatUsecaseParams params,
  );
  Future<Either<Failure, Cat>> getCatById(
    GetCatByIdUsecaseParams params,
  );
  Future<Either<Failure, Cat>> getCatByTag(
    GetCatByTagUsecaseParams params,
  );
  Future<Either<Failure, Cat>> getCatByIdOrTag(
    GetCatByIdOrTagUsecaseParams params,
  );
  Future<Either<Failure, void>> saveCatLocally(
    SaveCatLocallyUsecaseParams params,
  );
  Future<Either<Failure, void>> shareCat(
    ShareCatUsecaseParams params,
  );
}
