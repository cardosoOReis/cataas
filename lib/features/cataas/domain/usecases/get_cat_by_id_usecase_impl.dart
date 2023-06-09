import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../entities/cat.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByIdUsecaseImpl implements IGetCatByIdUsecase {
  final ICatRepository _repository;

  const GetCatByIdUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Cat>> call(GetCatByIdUsecaseParams params) {
    return _repository.getCatById(params);
  }
}
