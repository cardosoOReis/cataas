import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/i_cat_repository.dart';
import 'package:dartz/dartz.dart';

class SaveCatLocallyUsecase
    implements Usecase<void, SaveCatLocallyUsecaseParams> {
  final ICatRepository _repository;

  SaveCatLocallyUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(SaveCatLocallyUsecaseParams params) {
    return _repository.saveCatLocally(params);
  }
}

class SaveCatLocallyUsecaseParams {
  final String url;

  const SaveCatLocallyUsecaseParams({required this.url});
}
