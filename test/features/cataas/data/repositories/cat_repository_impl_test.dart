import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/platform/i_network_info.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/repositories/cat_repository_impl.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late ICatRemoteDatasource mockRemoteDatasource;
  late INetworkInfo mockNetworkInfo;
  late ICatRepository repository;
  setUp(() {
    registerFallbackValue(mockOptionString);
    mockRemoteDatasource = MockRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CatRepositoryImpl(
      remoteDatasource: mockRemoteDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('When [getRandomCat] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(
        () => mockRemoteDatasource.getRandomCat(
          text: any(named: 'text'),
          textColor: any(named: 'textColor'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer((_) async => mockCatModel);
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);

      // Act
      repository.getRandomCat(
        text: const None(),
        textColor: const None(),
        filter: const None(),
      );

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
            () => mockRemoteDatasource.getRandomCat(
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result = await repository.getRandomCat(
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getRandomCat(
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getRandomCat(
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result = await repository.getRandomCat(
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getRandomCat(
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockParseDataException);

          // Act
          final result = await repository.getRandomCat(
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

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
        final result = await repository.getRandomCat(
          text: const None(),
          textColor: const None(),
          filter: const None(),
        );

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
  group('When [getCatById] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(
        () => mockRemoteDatasource.getCatById(
          id: any(named: 'id'),
          text: any(named: 'text'),
          textColor: any(named: 'textColor'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer((_) async => mockCatModel);
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);

      // Act
      repository.getCatById(
        id: '',
        text: const None(),
        textColor: const None(),
        filter: const None(),
      );

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
            () => mockRemoteDatasource.getCatById(
              id: any(named: 'id'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result = await repository.getCatById(
            id: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getCatById(
              id: any(named: 'id'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatById(
              id: any(named: 'id'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result = await repository.getCatById(
            id: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatById(
              id: any(named: 'id'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockParseDataException);

          // Act
          final result = await repository.getCatById(
            id: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

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
        final result = await repository.getCatById(
          id: '',
          text: const None(),
          textColor: const None(),
          filter: const None(),
        );

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
  group('When [getCatByTag] is called,', () {
    test('should check if the device is online', () {
      // Arrange
      when(
        () => mockRemoteDatasource.getCatByTag(
          tag: any(named: 'tag'),
          text: any(named: 'text'),
          textColor: any(named: 'textColor'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer((_) async => mockCatModel);
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);

      // Act
      repository.getCatByTag(
        tag: '',
        text: const None(),
        textColor: const None(),
        filter: const None(),
      );

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
            () => mockRemoteDatasource.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => mockCatModel);

          // Act
          final result = await repository.getCatByTag(
            tag: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Right(mockCatModel));
          verify(
            () => mockRemoteDatasource.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          );
        });
      });
      group('and the call is unsucessful,', () {
        test(
            'and the reason is [CatNotFoundException], should return a Left with a [ApiFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockCatNotFoundException);

          // Act
          final result = await repository.getCatByTag(
            tag: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

          // Assert
          expect(result, Left(ApiFailure(exception: mockCatNotFoundException)));
        });
        test(
            'and the reason is [ParseDataException], should return a Left with a [ParseDataFailure]',
            () async {
          // Arrange
          when(
            () => mockRemoteDatasource.getCatByTag(
              tag: any(named: 'tag'),
              text: any(named: 'text'),
              textColor: any(named: 'textColor'),
              filter: any(named: 'filter'),
            ),
          ).thenThrow(mockParseDataException);

          // Act
          final result = await repository.getCatByTag(
            tag: '',
            text: const None(),
            textColor: const None(),
            filter: const None(),
          );

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
        final result = await repository.getCatByTag(
          tag: '',
          text: const None(),
          textColor: const None(),
          filter: const None(),
        );

        // Assert
        expect(result, Left(mockNoInternetConnectionFailure));
      });
    });
  });
}
