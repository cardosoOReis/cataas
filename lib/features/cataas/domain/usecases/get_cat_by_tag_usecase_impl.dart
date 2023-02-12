import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByTagUsecaseImpl implements IGetCatByTagUsecase {
  final ICatRepository _repository;

  const GetCatByTagUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, CatEntity>> call(params) {
    return _repository.getCatByTag(params);
  }
}
