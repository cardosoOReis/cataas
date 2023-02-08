import '../usecases/get_cat_by_id_usecase.dart';
import '../usecases/get_cat_by_tag_usecase.dart';
import '../usecases/get_random_cat_usecase.dart';
import '../usecases/save_cat_locally_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/cat_entity.dart';

abstract class ICatRepository {
  Future<Either<Failure, CatEntity>> getRandomCat(
    GetRandomCatUsecaseParams params,
  );
  Future<Either<Failure, CatEntity>> getCatById(
    GetCatByIdUsecaseParams params,
  );
  Future<Either<Failure, CatEntity>> getCatByTag(
    GetCatByTagUsecaseParams params,
  );
  Future<Either<Failure, void>> saveCatLocally(
    SaveCatLocallyUsecaseParams params,
  );
}
