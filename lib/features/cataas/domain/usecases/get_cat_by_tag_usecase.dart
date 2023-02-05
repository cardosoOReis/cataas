import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByTagUsecase
    implements Usecase<CatEntity, GetCatByTagUsecaseParams> {
  final ICatRepository repository;

  GetCatByTagUsecase(this.repository);

  @override
  Future<Either<Failure, CatEntity>> call(params) {
    return repository.getCatByTag(
      tag: params.tag,
      text: params.text,
      textColor: params.textColor,
      filter: params.filter,
    );
  }
}

class GetCatByTagUsecaseParams {
  final String tag;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetCatByTagUsecaseParams({
    required this.tag,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
