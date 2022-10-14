// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shell/layers/domain/repositories/get_cat_amount_repository.dart';
import 'package:shell/layers/domain/usecases/get_cat_amount/get_cat_amount_usecase.dart';

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
