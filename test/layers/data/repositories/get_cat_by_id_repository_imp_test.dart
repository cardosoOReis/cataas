import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_cat_by_id_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/repositories/get_cat_by_id_repository.dart';

void main() {
  GetCatByIdRepository repository =
      GetCatByIdRepositoryImp(DefaultGetCatByIdDatasourceImp());
  String id = '2kKhMn9BCAhMem6V';

  test('Should return a cat based on its id', () async {
    CatEntity result = await repository(id);

    expect(result, isNotNull);
  });
  test('Should have the same id that got passed', () async {
    CatEntity result = await repository(id);

    expect(result.id, id);
  });
}
