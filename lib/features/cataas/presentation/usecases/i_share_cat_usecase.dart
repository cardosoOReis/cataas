import '../../../../core/usecases/usecase.dart';

abstract class IShareCatUsecase extends Usecase<void, ShareCatUsecaseParams> {}

class ShareCatUsecaseParams {
  final String url;

  const ShareCatUsecaseParams({required this.url});
}
