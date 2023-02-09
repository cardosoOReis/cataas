import 'package:cataas/core/usecases/usecase.dart';

abstract class ISaveCatLocallyUsecase
    extends Usecase<void, SaveCatLocallyUsecaseParams> {}

class SaveCatLocallyUsecaseParams {
  final String url;

  const SaveCatLocallyUsecaseParams({required this.url});
}
