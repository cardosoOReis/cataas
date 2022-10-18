import '../../repositories/get_cat_amount_repository.dart';
import 'get_cat_amount_usecase.dart';

class GetCatAmountUsecaseImp implements GetCatAmountUsecase {
  final GetCatAmountRepository _getCatAmountRepository;
  GetCatAmountUsecaseImp(
    this._getCatAmountRepository,
  );

  @override
  Future<int> call() async {
    return await _getCatAmountRepository();
  }
}
