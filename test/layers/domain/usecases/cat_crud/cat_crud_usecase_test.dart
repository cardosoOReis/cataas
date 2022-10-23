import 'package:flutter_test/flutter_test.dart';
import 'package:shell/core/errors/empty_storage_exception.dart';
import 'package:shell/layers/data/datasources/local/default_cat_crud_datasource_imp.dart';
import 'package:shell/layers/data/repositories/cat_crud_repository_imp.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import 'package:shell/layers/domain/usecases/cat_crud/cat_crud_usecase.dart';
import 'package:shell/layers/domain/usecases/cat_crud/cat_crud_usecase_imp.dart';

void main() {
  CatCrudUsecase usecase = CatCrudUsecaseImp(
    CatCrudRepositoryImp(
      DefaultCatCrudDatasourceImp(),
    ),
  );

  test('Should return a result not null', () async {
    final CatEntity catEntity = CatEntity(
      id: '1234567890',
      type: 'image/png',
      createdAt: '23/10/2022',
      url: 'ola',
    );

    final result = await usecase.create(catEntity);
    expect(result, isNotNull);
  });

  test('Should return the same cat that was saved', () async {
    final CatEntity catEntity = CatEntity(
      id: '1234567890',
      type: 'image/png',
      createdAt: '23/10/2022',
      url: 'ola',
    );

    final result = await usecase.create(catEntity);
    expect(result, catEntity);
  });

  test('Should return the cat based on the index', () async {
    final result = await usecase.retrieve('0');
    expect(result, isNotNull);
  });

  test('Should return all cats', () async {
    final List<CatEntity>? result;
    try {
      result = await usecase.retrieveAll();
      expect(result, isNotEmpty);
    } on EmptyStorageException catch (e) {
      expect(e.message, 'No cats saved in the storage');
    }
  });
}
