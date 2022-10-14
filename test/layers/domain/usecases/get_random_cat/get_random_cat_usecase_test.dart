import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_random_cat_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/usecases/get_random_cat/get_random_cat_usecase.dart';
import 'package:shell/layers/domain/usecases/get_random_cat/get_random_cat_usecase_imp.dart';

void main() {
  test('Should return a not null random CatEntity instance', () async {
    GetRandomCatUsecase usecase = GetRandomCatUsecaseImp(
        GetRandomCatRepositoryImp(DefaultGetRandomCatDatasourceImp()));

    CatEntity result = await usecase();

    expect(result, isNotNull);
  });
}
