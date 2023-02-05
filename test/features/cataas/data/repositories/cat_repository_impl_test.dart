import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_local_datasource.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/repositories/cat_repository_impl.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late ICatRemoteDatasource mockRemoteDatasource;
  late ICatLocalDatasource mockLocalDatasource;
  late INetworkInfo mockNetworkInfo;
  late ICatRepository repository;
  setUp(() {
    registerFallbackValue(mockGetCatByIdUsecaseParams);
    registerFallbackValue(mockGetCatByTagUsecaseParams);
    registerFallbackValue(mockGetRandomCatUsecaseParams);
    registerFallbackValue(mockSaveCatLocallyUsecaseParams);
    mockRemoteDatasource = MockRemoteDatasource();
    mockLocalDatasource = MockLocalDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CatRepositoryImpl(
      remoteDatasource: mockRemoteDatasource,
      localDatasource: mockLocalDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('When [getRandomCat] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(
        () => mockRemoteDatasource.getRandomCat(any()),
      ).thenAnswer((_) async => mockCatModel);
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);

      // Act
      repository.getRandomCat(mockGetRandomCatUsecaseParams);

      //Assert
      verify(() => mockNetworkInfo.isConnected).called(1);
    });
    group('and is connected to the internet,', () {
      setUp(() {
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => true);
      });
      group('and the call is sucessful,', () {
        test('should return a Right with a [CatModel]', () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getRandomCat(any()),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result =
              await repository.getRandomCat(mockGetRandomCatUsecaseParams);

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getRandomCat(any()),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getRandomCat(any()),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result =
              await repository.getRandomCat(mockGetRandomCatUsecaseParams);

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getRandomCat(any()),
          ).thenThrow(mockParseDataException);

          // Act
          final result =
              await repository.getRandomCat(mockGetRandomCatUsecaseParams);

          // Assert
          expect(result,
              Left(ParseDataFailure(exception: mockParseDataException)));
        });
      });
    });
    group('and is not connected to the internet,', () {
      test('should return a Left with a [NoInternConnectionFailure]', () async {
        // Arrange
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => false);

        // Act
        final result =
            await repository.getRandomCat(mockGetRandomCatUsecaseParams);

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
  group('When [getCatById] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(
        () => mockRemoteDatasource.getCatById(any()),
      ).thenAnswer((_) async => mockCatModel);
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);

      // Act
      repository.getCatById(mockGetCatByIdUsecaseParams);

      //Assert
      verify(
        () => mockNetworkInfo.isConnected,
      ).called(1);
    });
    group('and is connected to the internet,', () {
      setUp(() {
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => true);
      });
      group('and the call is sucessful,', () {
        test('should return a Right with a [CatModel]', () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatById(any()),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result =
              await repository.getCatById(mockGetCatByIdUsecaseParams);

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getCatById(any()),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatById(any()),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result =
              await repository.getCatById(mockGetCatByIdUsecaseParams);

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatById(any()),
          ).thenThrow(mockParseDataException);

          // Act
          final result =
              await repository.getCatById(mockGetCatByIdUsecaseParams);

          // Assert
          expect(result,
              Left(ParseDataFailure(exception: mockParseDataException)));
        });
      });
    });
    group('and is not connected to the internet,', () {
      test('should return a Left with a [NoInternConnectionFailure]', () async {
        // Arrange
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => false);

        // Act
        final result = await repository.getCatById(mockGetCatByIdUsecaseParams);

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
  group('When [getCatByTag] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(() => mockRemoteDatasource.getCatByTag(any()))
          .thenAnswer((_) async => mockCatModel);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Act
      repository.getCatByTag(mockGetCatByTagUsecaseParams);

      //Assert
      verify(() => mockNetworkInfo.isConnected).called(1);
    });
    group('and is connected to the internet,', () {
      setUp(() {
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => true);
      });
      group('and the call is sucessful,', () {
        test('should return a Right with a [CatModel]', () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatByTag(any()),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result =
              await repository.getCatByTag(mockGetCatByTagUsecaseParams);

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getCatByTag(any()),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatByTag(any()),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result =
              await repository.getCatByTag(mockGetCatByTagUsecaseParams);

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatByTag(any()),
          ).thenThrow(mockParseDataException);

          // Act
          final result =
              await repository.getCatByTag(mockGetCatByTagUsecaseParams);

          // Assert
          expect(result,
              Left(ParseDataFailure(exception: mockParseDataException)));
        });
      });
    });
    group('and is not connected to the internet,', () {
      test('should return a Left with a [NoInternConnectionFailure]', () async {
        // Arrange
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => false);

        // Act
        final result =
            await repository.getCatByTag(mockGetCatByTagUsecaseParams);

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
  group('When [saveCatLocally] is called,', () {
    group('and the call is sucessful,', () {
      test('should return a Right with a [null]', () async {
        // Arrange
        when(() => mockLocalDatasource.saveCatLocally(any()))
            .thenAnswer((_) async {});

        // Act
        final result =
            await repository.saveCatLocally(mockSaveCatLocallyUsecaseParams);

        // Assert
        expect(result, const Right(null));
      });
    });
    group('and the call is unsucessful,', () {
      test('should return a Left with a [SaveCatLocallyFailure]', () async {
        // Arrange
        when(() => mockLocalDatasource.saveCatLocally(any()))
            .thenThrow(mockSaveCatLocallyException);

        // Act
        final result =
            await repository.saveCatLocally(mockSaveCatLocallyUsecaseParams);

        // Assert
        expect(
            result,
            Left(
                SaveCatLocallyFailure(exception: mockSaveCatLocallyException)));
      });
    });
  });
}
