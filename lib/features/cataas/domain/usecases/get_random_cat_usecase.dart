import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetRandomCatUsecase
    implements Usecase<CatEntity, GetRandomCatUsecaseParams> {
  final ICatRepository repository;
  GetRandomCatUsecase(this.repository);

  @override
  Future<Either<Failure, CatEntity>> call(GetRandomCatUsecaseParams params) {
    return repository.getRandomCat(
      text: params.text,
      textColor: params.textColor,
      filter: params.filter,
    );
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
