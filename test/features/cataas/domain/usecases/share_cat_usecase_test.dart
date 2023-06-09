import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/share_cat_usecase_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late ShareCatUsecaseImpl usecase;
  late ICatRepository mockRepository;

  setUp(() {
    registerFallbackValue(mockShareCatUsecaseParams);
    mockRepository = MockICatRepository();
    usecase = ShareCatUsecaseImpl(mockRepository);
  });

  group('When [ShareCatUsecaseImpl] is called,', () {
    group('and the call is successful,', () {
      test('should return a Right with a [null]', () async {
        //Arrange
        when(
          () => mockRepository.shareCat(any()),
        ).thenAnswer((_) async => const Right(null));

        //Act
        final result = await usecase(mockShareCatUsecaseParams);

        //Assert
        expect(result, const Right(null));
      });
    });
    group('and the unsuccessful,', () {
      test('should return a Left with a [Failure]', () async {
        //Arrange
        when(
          () => mockRepository.shareCat(any()),
        ).thenAnswer((_) async => Left(mockFailure));

        //Act
        final result = await usecase(mockShareCatUsecaseParams);

        //Assert
        expect(result, Left(mockFailure));
      });
    });
  });
}
