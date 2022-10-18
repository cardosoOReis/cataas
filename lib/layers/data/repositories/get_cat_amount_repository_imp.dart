import 'package:shell/layers/data/datasources/get_cat_amount_datasource.dart';
import 'package:shell/layers/domain/repositories/get_cat_amount_repository.dart';

class GetCatAmountRepositoryImp implements GetCatAmountRepository {
  final GetCatAmountDatasource _getCatAmountDatasource;
  GetCatAmountRepositoryImp(
    this._getCatAmountDatasource,
  );

  @override
  Future<int> call() async {
    return await _getCatAmountDatasource();
  }
}
