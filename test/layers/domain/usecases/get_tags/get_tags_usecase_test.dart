import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_tags_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_tags_repository_imp.dart';
import 'package:shell/layers/domain/usecases/get_tags/get_tags_usecase.dart';
import 'package:shell/layers/domain/usecases/get_tags/get_tags_usecase_imp.dart';

void main() {
  GetTagsUsecase usecase = GetTagsUsecaseImp(
    GetTagsRepositoryImp(
      DefaultGetTagsDatasourceImp(),
    ),
  );

  test('Should return a list', () async {
    var result = await usecase();

    expect(result, isNotNull);
  });
  test('Should contain a list with at least 1 item', () async {
    var result = await usecase();

    expect(result, isNotEmpty);
  });
}
