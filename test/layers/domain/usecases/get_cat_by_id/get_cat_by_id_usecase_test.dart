import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_cat_by_id_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/usecases/get_cat_by_id/get_cat_by_id_usecase.dart';
import 'package:shell/layers/domain/usecases/get_cat_by_id/get_cat_by_id_usecase_imp.dart';

void main() {
  test('Should return a catEntity by its id', () async {
    GetCatByIdUsecase usecase = GetCatByIdUsecaseImp(GetCatByIdRepositoryImp(DefaultGetCatByIdDatasourceImp()));

    String id = '2kKhMn9BCAhMem6V';

    CatEntity result = await usecase(id);

    expect(result, isNotNull);
  });

  test('Should return Cat Entity with id equals to the id passed', () async {
    GetCatByIdUsecase usecase = GetCatByIdUsecaseImp(GetCatByIdRepositoryImp(DefaultGetCatByIdDatasourceImp()));

    String id = '2kKhMn9BCAhMem6V';

    CatEntity result = await usecase(id);

    expect(result.id, equals(id));
  });

  test('Should return Cat Entity with id on the url', () async {
    GetCatByIdUsecase usecase = GetCatByIdUsecaseImp(GetCatByIdRepositoryImp(DefaultGetCatByIdDatasourceImp()));

    String id = 'Gtr1p9H06A6O9HYU';

    CatEntity result = await usecase(id);

    expect(result.url, contains(id));
  });
}
