import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../entities/cat.dart';
import '../repositories/i_cat_repository.dart';

class GetRandomCatUsecaseImpl implements IGetRandomCatUsecase {
  final ICatRepository _repository;

  const GetRandomCatUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Cat>> call(GetRandomCatUsecaseParams params) =>
      _repository.getRandomCat(params);
}
