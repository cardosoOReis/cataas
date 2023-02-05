import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetRandomCatUsecase
    implements Usecase<CatEntity, GetRandomCatUsecaseParams> {
  final ICatRepository _repository;
  GetRandomCatUsecase(this._repository);

  @override
  Future<Either<Failure, CatEntity>> call(GetRandomCatUsecaseParams params) {
    return _repository.getRandomCat(params);
  }
}

class GetRandomCatUsecaseParams {
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetRandomCatUsecaseParams({
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
