import 'dart:io';
import 'package:hive/hive.dart';
import 'package:shell/core/errors/empty_storage_exception.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';
import '../../dto/cat_dto.dart';
import '../cat_crud_datasource.dart';

class DefaultCatCrudDatasourceImp implements CatCrudDatasource {
  HiveInterface hive = Hive
    ..init(Directory.current.path)
    ..registerAdapter(CatEntityAdapter());

  @override
  Future<CatDto> create(CatEntity catEntity) async {
    var box = await hive.openBox<CatEntity>('catBox');
    try {
      box.add(catEntity);
    } catch (e) {
      throw Exception('#ERRO: Databse insertion unsucessfull');
    }
    return CatDto(
      id: catEntity.id,
      type: catEntity.type,
      createdAt: catEntity.createdAt,
      url: catEntity.url,
      text: catEntity.text,
      textColor: catEntity.textColor,
      tags: catEntity.tags,
      filter: catEntity.filter,
    );
  }

  @override
  Future<CatDto?> retrieve(String id) async {
    var box = await hive.openBox<CatEntity>('catBox');
    final result = box.getAt(int.parse(id));
    if (result == null) {
      throw EmptyStorageException('No cat with this id');
    }
    return CatDto(
      id: result.id,
      type: result.type,
      createdAt: result.createdAt,
      url: result.url,
      tags: result.tags,
      text: result.text,
      textColor: result.textColor,
      filter: result.filter,
    );
  }

  @override
  Future<List<CatDto>?> retrieveAll() async {
    var box = await hive.openBox<CatEntity>('catBox');
    final result = box.values;
    if (result.isEmpty) {
      throw EmptyStorageException('No cats saved in the storage');
    }
    List<CatDto> catList = [];
    for (var element in result) {
      catList.add(CatDto(
        id: element.id,
        type: element.type,
        createdAt: element.createdAt,
        url: element.url,
        tags: element.tags,
        text: element.text,
        textColor: element.textColor,
        filter: element.filter,
      ));
    }
    return catList;
  }

  @override
  Future<CatDto> update(String id) {
    //TODO - UPDATE METHOD
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) async {
    final box = await hive.openBox<CatEntity>('catBox');
    if (box.length > int.parse(id)) {
      throw EmptyStorageException('Not found in storage');
    }
    box.deleteAt(int.parse(id));
  }
}
