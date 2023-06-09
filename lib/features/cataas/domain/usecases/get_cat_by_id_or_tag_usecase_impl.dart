import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../entities/cat.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByIdOrTagUsecaseImpl implements IGetCatByIdOrTagUsecase {
  final ICatRepository _repository;

  const GetCatByIdOrTagUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Cat>> call(GetCatByIdOrTagUsecaseParams params) {
    return _repository.getCatByIdOrTag(params);
  }
}
