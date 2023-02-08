import 'package:cataas/core/error/failures.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/save_cat_locally_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late SaveCatLocallyUsecase usecase;
  late ICatRepository mockRepository;

  setUp(() {
    registerFallbackValue(mockSaveCatLocallyUsecaseParams);
    mockRepository = MockICatRepository();
    usecase = SaveCatLocallyUsecase(mockRepository);
  });

  group('When [SaveCatLocallyUsecase] is called,', () {
    group('and the call is successful,', () {
      test('should return a Right with a [null]', () async {
        // Arrange
        when(() => mockRepository.saveCatLocally(any()))
            .thenAnswer((invocation) async => const Right(null));

        // Act
        final result = await usecase(mockSaveCatLocallyUsecaseParams);

        // Assert
        expect(result, const Right(null));
      });
    });
    group('and the call is unsuccessful,', () {
      test('should return a Left with a [SaveCatLocallyFailure]', () async {
        // Arrange
        when(() => mockRepository.saveCatLocally(any())).thenAnswer(
            (invocation) async => Left(
                SaveCatLocallyFailure(exception: mockSaveCatLocallyException)));

        // Act
        final result = await usecase(mockSaveCatLocallyUsecaseParams);

        // Assert
        expect(
            result,
            Left(
                SaveCatLocallyFailure(exception: mockSaveCatLocallyException)));
      });
    });
  });
}
