import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks.dart';

void main() {
  late GetRandomCatUsecase usecase;
  late ICatRepository mockRepository;

  setUp(() {
    registerFallbackValue(const Some(''));
    mockRepository = MockICatRepository();
    usecase = GetRandomCatUsecase(mockRepository);
  });

  group('When [GetRandomCatUsecase] is called,', () {
    group('and the call is sucessful,', () {
      test('should return a Right with a [CatEntity]', () async {
        // Arrange
        when(() => mockRepository.getRandomCat(
                text: any(named: 'text'),
                filter: any(named: 'filter'),
                textColor: any(named: 'textColor')))
            .thenAnswer((_) async => Right(mockCatEntity));
        // Act
        final result = await usecase(mockGetRandomCatUsecaseParams);

        // Assert
        expect(result, Right(mockCatEntity));
        verify(
          () => mockRepository.getRandomCat(
              text: any(named: 'text'),
              filter: any(named: 'filter'),
              textColor: any(named: 'textColor')),
        ).called(1);
      });
    });
    group('and the call is unsucessful,', () {
      test('should return an Left with a [Failure]', () async {
        // Arrange
        when(
          () => mockRepository.getRandomCat(
            text: any(named: 'text'),
            filter: any(named: 'filter'),
            textColor: any(named: 'textColor'),
          ),
        ).thenAnswer((_) async => Left(mockFailure));

        // Act
        final result = await usecase(mockGetRandomCatUsecaseParams);

        // Assert
        expect(result, Left(mockFailure));
        verify(
          () => mockRepository.getRandomCat(
            text: any(named: 'text'),
            filter: any(named: 'filter'),
            textColor: any(named: 'textColor'),
          ),
        ).called(1);
      });
    });
  });
}
