import 'dart:convert';

import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:cataas/features/cataas/domain/entities/cat.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  late CatModel model;
  setUp(() {
    model = CatModel(
      id: '',
      fileType: FileType.image,
      requestedAt: DateTime(2023),
      url: '',
      tags: const [],
    );
  });

  test('CatModel should be a subclass of CatEntity', () {
    // Assert
    expect(model, isA<Cat>());
  });
  group('When [fromJson] is called,', () {
    group('and the json is valid,', () {
      test('should return a valid model', () {
        // Arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('cat.json'));

        // Act & Assert
        expect(
          () => CatModel.fromJson(
            json: jsonMap,
            filter: const None(),
            text: const None(),
            textColor: const None(),
          ),
          returnsNormally,
        );
      });
    });
  });
}
