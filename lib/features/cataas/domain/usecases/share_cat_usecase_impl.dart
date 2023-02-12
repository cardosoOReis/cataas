import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../presentation/usecases/i_share_cat_usecase.dart';
import '../repositories/i_cat_repository.dart';

class ShareCatUsecaseImpl implements IShareCatUsecase {
  final ICatRepository _repository;

  const ShareCatUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, void>> call(ShareCatUsecaseParams params) {
    return _repository.shareCat(params);
  }
}
