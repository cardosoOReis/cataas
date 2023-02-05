import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late ICatRepository mockRepository;
  late GetCatByTagUsecase usecase;

  setUp(() {
    registerFallbackValue(const Some(''));
    mockRepository = MockICatRepository();
    usecase = GetCatByTagUsecase(mockRepository);
  });

  group('When [GetCatByTagUsecase] is called,', () {
    group('and the call is sucessful,', () {
      test('should return a Right with a [CatEntity]', () async {
        // Arrange
        when(() => mockRepository.getCatByTag(
                tag: any(named: 'tag'),
                text: any(named: 'text'),
                filter: any(named: 'filter'),
                textColor: any(named: 'textColor')))
            .thenAnswer((_) async => Right(mockCatEntity));
        // Act
        final result = await usecase(mockGetCatByTagUsecaseParams);

        // Assert
        expect(result, Right(mockCatEntity));
        verify(
          () => mockRepository.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              filter: any(named: 'filter'),
              textColor: any(named: 'textColor')),
        ).called(1);
      });
    });
    group('and the call is unsucessful,', () {
      test('should return an Left with a [Failure]', () async {
        // Arrange
        when(() => mockRepository.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              filter: any(named: 'filter'),
              textColor: any(named: 'textColor'),
            )).thenAnswer((_) async => Left(mockFailure));

        // Act
        final result = await usecase(mockGetCatByTagUsecaseParams);

        // Assert
        expect(result, Left(mockFailure));
        verify(
          () => mockRepository.getCatByTag(
            tag: any(named: 'tag'),
            text: any(named: 'text'),
            filter: any(named: 'filter'),
            textColor: any(named: 'textColor'),
          ),
        ).called(1);
      });
    });
  });
}
