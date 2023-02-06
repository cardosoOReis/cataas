import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/features/cataas/data/datasources/implementations/cat_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late CatLocalDatasourceImpl datasource;
  late MockSaveImageLocallyService mockSaveImageLocallyService;

  setUp(() {
    mockSaveImageLocallyService = MockSaveImageLocallyService();
    datasource = CatLocalDatasourceImpl(service: mockSaveImageLocallyService);
  });

  group('When [saveCatLocally] is called,', () {
    group('and is saved sucessfuly,', () {
      test('should return a null', () async {
        // Arrange
        when(
          () => mockSaveImageLocallyService.saveImage(url: any(named: 'url')),
        ).thenAnswer((_) async => {});

        // Act
        await datasource.saveCatLocally(mockSaveCatLocallyUsecaseParams);

        // Assert
        verify(
          () => mockSaveImageLocallyService.saveImage(url: any(named: 'url')),
        ).called(1);
        expect(
            () async => await datasource
                .saveCatLocally(mockSaveCatLocallyUsecaseParams),
            isA<void>());
      });
    });
    group('and is unsucessful,', () {
      test('should throw a [SaveCatLocallyException]', () {
        // Arrange
        when(
          () => mockSaveImageLocallyService.saveImage(url: any(named: 'url')),
        ).thenThrow(mockSaveCatLocallyException);

        // Act
        final result =
            datasource.saveCatLocally(mockSaveCatLocallyUsecaseParams);

        // Assert
        expect(result, throwsA(isA<SaveCatLocallyException>()));
      });
    });
  });
}
