import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_or_tag_usecase_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late GetCatByIdOrTagUsecaseImpl usecase;
  late ICatRepository mockRepository;
  setUp(() {
    registerFallbackValue(mockGetCatByIdOrTagUsecaseParams);
    mockRepository = MockICatRepository();
    usecase = GetCatByIdOrTagUsecaseImpl(mockRepository);
  });

  group('When [GetCatByIdOrTagUsecase] is called,', () {
    group('and the call is successful,', () {
      test('should return a Right with a [CatEntity]', () async {
        // Arrange
        when(
          () => mockRepository.getCatByIdOrTag(any()),
        ).thenAnswer((_) async => Right(mockCatEntity));
        // Act
        final result = await usecase(mockGetCatByIdOrTagUsecaseParams);

        // Assert
        expect(result, Right(mockCatEntity));
        verify(
          () => mockRepository.getCatByIdOrTag(any()),
        ).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('should return an Left with a [Failure]', () async {
        // Arrange
        when(() => mockRepository.getCatByIdOrTag(any()))
            .thenAnswer((_) async => Left(mockFailure));

        // Act
        final result = await usecase(mockGetCatByIdOrTagUsecaseParams);

        // Assert
        expect(result, Left(mockFailure));
        verify(
          () => mockRepository.getCatByIdOrTag(any()),
        ).called(1);
      });
    });
  });
}
