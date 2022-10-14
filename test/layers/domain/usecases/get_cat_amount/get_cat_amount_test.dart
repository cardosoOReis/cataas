import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_cat_amount_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_cat_amount_repository_imp.dart';
import 'package:shell/layers/domain/usecases/get_cat_amount/get_cat_amount_usecase.dart';
import 'package:shell/layers/domain/usecases/get_cat_amount/get_cat_amount_usecase_imp.dart';

void main() {
  
  GetCatAmountUsecase usecase = 
  GetCatAmountUsecaseImp(
    GetCatAmountRepositoryImp(
      DefaultGetCatAmountDatasourceImp()
    )
  );

  test('Should return not null', () async {
    
    int result = await usecase();

    expect(result, isNotNull);

  });

  test('Should return a number bigger than or equal to 0', () async {
    
    int result = await usecase();

    expect(result, isNonNegative);
  });

}