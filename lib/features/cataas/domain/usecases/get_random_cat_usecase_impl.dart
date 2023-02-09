import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetRandomCatUsecaseImpl implements IGetRandomCatUsecase {
  final ICatRepository _repository;
  GetRandomCatUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, CatEntity>> call(GetRandomCatUsecaseParams params) {
    return _repository.getRandomCat(params);
  }
}
