import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../entities/cat_entity.dart';
import '../repositories/i_cat_repository.dart';

class GetCatByIdUsecaseImpl implements IGetCatByIdUsecase {
  final ICatRepository _repository;

  GetCatByIdUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, CatEntity>> call(GetCatByIdUsecaseParams params) {
    return _repository.getCatById(params);
  }
}
