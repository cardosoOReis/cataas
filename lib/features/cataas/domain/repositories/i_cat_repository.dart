import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/cat_entity.dart';

abstract class ICatRepository {
  Future<Either<Failure, CatEntity>> getRandomCat({
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
  Future<Either<Failure, CatEntity>> getCatById({
    required String id,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
  Future<Either<Failure, CatEntity>> getCatByTag({
    required String tag,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
}
