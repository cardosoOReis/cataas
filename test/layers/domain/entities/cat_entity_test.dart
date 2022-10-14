import 'package:flutter_test/flutter_test.dart';
import 'package:shell/layers/domain/entities/cat_entity.dart';

void main() {
  test('Entity should not be null', () {
    CatEntity catEntity = CatEntity(
      id: 'Gtr1p9H06A6O9HYU',
      type: 'image/jpg',
      createdAt: '2022-10-13',
      url: '/cat/Gtr1p9H06A6O9HYU'
    );
    expect(catEntity, isNotNull);
  });

  test('Entity with all attributes should not be null', () {
    CatEntity catEntity = CatEntity(
      id: '1234',
      type: 'image/jpg',
      createdAt: '2022-10-13',
      url: 'Gtr1p9H06A6O9HYU',
      tags: ['cute', 'big eyes'],
      text: 'Hello World',
      textColor: 'white',
      filter: 'sepia',
    );

    expect(catEntity, isNotNull);
  });

  test('Attributes from an entity with all attributes should not be null', () {
    CatEntity catEntity = CatEntity(
      id: '1234',
      type: 'image/jpg',
      createdAt: '2022-10-13',
      url: 'Gtr1p9H06A6O9HYU',
      tags: ['cute', 'big eyes'],
      text: 'Hello World',
      textColor: 'white',
      filter: 'sepia',
    );

    

    expect(catEntity.id, '1234');
    expect(catEntity.type, 'image/jpg');
    expect(catEntity.createdAt, '2022-10-13');
    expect(catEntity.url, 'Gtr1p9H06A6O9HYU');
    expect(catEntity.tags, ['cute', 'big eyes']);
    expect(catEntity.text, 'Hello World');
    expect(catEntity.textColor, 'white');
    expect(catEntity.filter, 'sepia');
  });
}
