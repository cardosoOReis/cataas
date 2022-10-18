import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_cat_by_id_with_params_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_cat_by_id_with_params_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/usecases/get_cat_by_id_with_params/get_cat_by_id_with_params_usecase.dart';
import 'package:shell/layers/domain/usecases/get_cat_by_id_with_params/get_cat_by_id_with_params_usecase_imp.dart';

void main() {
  GetCatByIdWithParamsUsecase usecase = GetCatByIdWithParamsUsecaseImp(
    GetCatByIdWithParamsRepositoryImp(
      DefaultGetCatByIdWithParamsDatasourceImp(),
    ),
  );

  test('Should return a catEntity by its id', () async {
    String id = '2kKhMn9BCAhMem6V';

    CatEntity result = await usecase(id: id);

    expect(result, isNotNull);
  });

  test('Should return Cat Entity with id equals to the id passed', () async {
    String id = '2kKhMn9BCAhMem6V';

    CatEntity result = await usecase(id: id);

    expect(result.id, equals(id));
  });

  test('Should return Cat Entity with id on the url', () async {
    String id = 'Gtr1p9H06A6O9HYU';

    CatEntity result = await usecase(id: id);

    expect(result.url, contains(id));
  });

  test('Should return Cat Entity with the params given', () async {
    String id = 'Gtr1p9H06A6O9HYU';
    String text = 'Hello World';
    String textColor = 'red';
    String filter = 'sepia';

    CatEntity result =
        await usecase(id: id, text: text, textColor: textColor, filter: filter);

    expect(result.id, id);
    expect(result.text, text);
    expect(result.textColor, textColor);
    expect(result.filter, filter);
  });
}
