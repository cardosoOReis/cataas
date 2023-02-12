import 'package:cataas/core/error/failures.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_share_cat_usecase.dart';
import 'package:dartz/dartz.dart';

class ShareCatUsecaseImpl implements IShareCatUsecase {
  final ICatRepository _repository;

  ShareCatUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, void>> call(ShareCatUsecaseParams params) {
    return _repository.shareCat(params);
  }
}
