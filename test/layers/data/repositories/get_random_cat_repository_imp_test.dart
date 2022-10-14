import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_random_cat_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/repositories/get_random_cat_repository.dart';

void main() {
  GetRandomCatRepository repository = GetRandomCatRepositoryImp(DefaultGetRandomCatDatasourceImp());

  test('Should return a random cat', () async {
    CatEntity result = await repository();

    expect(result, isNotNull);
  });
}
