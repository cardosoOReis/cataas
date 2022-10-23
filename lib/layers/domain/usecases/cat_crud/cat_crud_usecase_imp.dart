// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shell/layers/domain/repositories/cat_crud_repository.dart';

import '../../entities/cat_entity.dart';
import 'cat_crud_usecase.dart';

class CatCrudUsecaseImp implements CatCrudUsecase {
  final CatCrudRepository _catCrudRepository;
  CatCrudUsecaseImp(
    this._catCrudRepository,
  );

  @override
  Future<CatEntity> create(CatEntity catEntity) async {
    return await _catCrudRepository.create(catEntity);
  }

  @override
  Future<CatEntity?> retrieve(String id) async {
    return await _catCrudRepository.retrieve(id);
  }

  @override
  Future<CatEntity> update(String id) async {
    return await _catCrudRepository.update(id);
  }

  @override
  Future<void> delete(String id) async {
    return await _catCrudRepository.delete(id);
  }

  @override
  Future<List<CatEntity>?> retrieveAll() async {
    return await _catCrudRepository.retrieveAll();
  }
}
