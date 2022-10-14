import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_random_cat_with_params_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_random_cat_with_params_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase.dart';
import 'package:shell/layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase_imp.dart';

void main() {
  GetRandomCatWithParamsUsecase usecase = GetRandomCatWithParamsUsecaseImp(
    GetRandomCatWithParamsRepositoryImp(
      DefaultGetRandomCatWithParamsDatasourceImp(),
    ),
  );
  test('Should return a Cat Entity not null', () async {
    CatEntity result = await usecase();

    expect(result, isNotNull);
  });

  test('Should return a Cat Entity even with 0 params passed', () async {
    CatEntity result = await usecase();

    expect(result, isNotNull);
  });

  test('Should return a Cat Entity when all params are passed', () async {
    CatEntity result = await usecase(
      tag: 'cute',
      text: 'Hello World',
      textColor: 'red',
      filter: 'sepia',
    );

    expect(result, isNotNull);
  });

  test(
      'Should return a Cat Entity with all attributes not null when all params are passed',
      () async {
    String tag = 'cute';
    String text = 'Hello World';
    String textColor = 'red';
    String filter = 'sepia';

    CatEntity result = await usecase.call(
      tag: tag,
      text: text,
      textColor: textColor,
      filter: filter,
    );

    expect(result.id, isNotNull);
    expect(result.createdAt, isNotNull);
    expect(result.type, isNotNull);
    expect(result.url, isNotNull);
    expect(result.tags, contains(tag));
    expect(result.text, text);
    expect(result.textColor, textColor);
    expect(result.filter, filter);
  });
}
