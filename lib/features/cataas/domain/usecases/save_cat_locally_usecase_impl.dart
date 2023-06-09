import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_save_cat_locally_usecase.dart';
import '../repositories/i_cat_repository.dart';

class SaveCatLocallyUsecaseImpl implements ISaveCatLocallyUsecase {
  final ICatRepository _repository;

  const SaveCatLocallyUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, void>> call(SaveCatLocallyUsecaseParams params) {
    return _repository.saveCatLocally(params);
  }
}
