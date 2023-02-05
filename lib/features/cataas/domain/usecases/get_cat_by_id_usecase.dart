import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByIdUsecase implements Usecase<CatEntity, GetCatByIdUsecaseParams> {
  final ICatRepository _repository;

  GetCatByIdUsecase(this._repository);

  @override
  Future<Either<Failure, CatEntity>> call(GetCatByIdUsecaseParams params) {
    return _repository.getCatById(params);
  }
}

class GetCatByIdUsecaseParams {
  final String id;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetCatByIdUsecaseParams({
    required this.id,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
