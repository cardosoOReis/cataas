import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks.dart';

void main() {
  late GetRandomCatUsecaseImpl usecase;
  late ICatRepository mockRepository;

  setUp(() {
    registerFallbackValue(mockGetRandomCatUsecaseParams);
    mockRepository = MockICatRepository();
    usecase = GetRandomCatUsecaseImpl(mockRepository);
  });

  group('When [GetRandomCatUsecase] is called,', () {
    group('and the call is successful,', () {
      test('should return a Right with a [CatEntity]', () async {
        // Arrange
        when(
          () => mockRepository.getRandomCat(any()),
        ).thenAnswer((_) async => Right(mockCatEntity));
        // Act
        final result = await usecase(mockGetRandomCatUsecaseParams);

        // Assert
        expect(result, Right(mockCatEntity));
        verify(() => mockRepository.getRandomCat(any())).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('should return an Left with a [Failure]', () async {
        // Arrange
        when(
          () => mockRepository.getRandomCat(any()),
        ).thenAnswer((_) async => Left(mockFailure));

        // Act
        final result = await usecase(mockGetRandomCatUsecaseParams);

        // Assert
        expect(result, Left(mockFailure));
        verify(() => mockRepository.getRandomCat(any())).called(1);
      });
    });
  });
}
