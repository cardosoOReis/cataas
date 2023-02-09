import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks.dart';

void main() {
  late GetCatByIdUsecaseImpl usecase;
  late ICatRepository mockRepository;

  setUp(() {
    registerFallbackValue(mockGetCatByIdUsecaseParams);
    mockRepository = MockICatRepository();
    usecase = GetCatByIdUsecaseImpl(mockRepository);
  });

  group('When [GetCatByIdUsecase] is called,', () {
    group('and the call is successful,', () {
      test('should return a Right with a [CatEntity]', () async {
        // Arrange
        when(() => mockRepository.getCatById(any()))
            .thenAnswer((_) async => Right(mockCatEntity));
        // Act
        final result = await usecase(mockGetCatByIdUsecaseParams);

        // Assert
        expect(result, Right(mockCatEntity));
        verify(
          () => mockRepository.getCatById(any()),
        ).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('should return an Left with a [Failure]', () async {
        // Arrange
        when(() => mockRepository.getCatById(any()))
            .thenAnswer((_) async => Left(mockFailure));

        // Act
        final result = await usecase(mockGetCatByIdUsecaseParams);

        // Assert
        expect(result, Left(mockFailure));
        verify(
          () => mockRepository.getCatById(any()),
        ).called(1);
      });
    });
  });
}
