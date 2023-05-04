import 'dart:convert';

import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/core/services/share_image/i_share_image_service.dart';
import 'package:cataas/features/cataas/data/datasources/implementations/cat_remote_datasource_impl.dart';
import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../mocks.dart';

void main() {
  late CatRemoteDatasourceImpl datasource;
  late IShareImageService mockShareImageService;
  late Dio mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockShareImageService = MockShareImageService();
    datasource = CatRemoteDatasourceImpl(
      client: mockHttpClient,
      shareImageService: mockShareImageService,
    );
  });

  void setUpMock200Response() {
    when(
      () => mockHttpClient.get(
        any(),
        queryParameters: any(
          named: 'queryParameters',
        ),
      ),
    ).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(fixture('cat.json')),
          statusCode: 200,
        ));
  }

  void setUpMock404Response() {
    when(
      () => mockHttpClient.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        error: 'Not Found',
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      ),
    );
  }

  void setUpMock500Response() {
    when(
      () => mockHttpClient.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        error: 'Server Failure',
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 502,
        ),
      ),
    );
  }

  void setUpMockDefaultErrorResponse() {
    when(
      () => mockHttpClient.get(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenThrow(
      DioError(requestOptions: RequestOptions(path: '')),
    );
  }

  group('When [getCatById] is called,', () {
    test('should perform a GET request on a url with the id on the URL', () {
      // Arrange
      setUpMock200Response();

      // Act
      datasource.getCatById(mockGetCatByIdUsecaseParams);

      // Assert
      verify(
        () => mockHttpClient.get(
          any(
            that: contains(mockGetCatByIdUsecaseParams.id),
          ),
          queryParameters: any(
            named: 'queryParameters',
            that: containsPair('json', 'true'),
          ),
        ),
      ).called(1);
    });
    group('and the call is successful,', () {
      test('should return an [CatModel]', () async {
        //Arrange
        setUpMock200Response();

        //Act
        final result = await datasource.getCatById(mockGetCatByIdUsecaseParams);

        //Assert
        expect(result, isA<CatModel>());
      });
      test(
          'the returned model should have the text, textColor and filter as it was passed by the params',
          () async {
        // Arrange
        setUpMock200Response();

        // Act
        final result = await datasource.getCatById(mockGetCatByIdUsecaseParams);

        // Assert
        expect(
          result,
          isA<CatModel>()
              .having(
                (catModel) => catModel.text,
                'text',
                mockGetCatByIdUsecaseParams.text.toNullable(),
              )
              .having(
                (p0) => p0.textColor,
                'textColor',
                mockGetCatByIdUsecaseParams.textColor.toNullable(),
              )
              .having(
                (p0) => p0.filter,
                'filter',
                mockGetCatByIdUsecaseParams.filter.toNullable(),
              ),
        );
        verify(() {
          final text =
              mockGetCatByIdUsecaseParams.text.fold(() => null, (text) => text);
          final textColor = mockGetCatByIdUsecaseParams.textColor
              .fold(() => null, (textColor) => textColor);
          final filter = mockGetCatByIdUsecaseParams.filter
              .fold(() => null, (filter) => filter);
          mockHttpClient.get(
              'https://cataas.com/cat/${mockGetCatByIdUsecaseParams.id}/says/$text',
              queryParameters: {
                'json': 'true',
                'textColor': textColor,
                'filter': filter,
              });
        }).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('and the statusCode is 404, should throw a [CatNotFoundException]',
          () async {
        //Arrange
        setUpMock404Response();

        //Act
        final call = datasource.getCatById;

        //Assert
        expect(() => call(mockGetCatByIdUsecaseParams),
            throwsA(isA<CatNotFoundException>()));
      });
      test('and the status code is >= 500, should throw a [ServerException]',
          () {
        //Arrange
        setUpMock500Response();

        // Act
        final call = datasource.getCatById;

        //Assert
        expect(() => call(mockGetCatByIdUsecaseParams),
            throwsA(isA<ServerException>()));
      });
      test(
          'and the status code is not >= 500 or == 404, should throw an [ApiException]',
          () {
        // Arrange
        setUpMockDefaultErrorResponse();

        // Act
        final call = datasource.getCatById;

        // Assert
        expect(() => call(mockGetCatByIdUsecaseParams),
            throwsA(isA<ApiException>()));
      });
    });
  });
  group('When [getCatByTag] is called,', () {
    test('should perform a GET request on a url with the tag on the URL', () {
      // Arrange
      setUpMock200Response();

      // Act
      datasource.getCatByTag(mockGetCatByTagUsecaseParams);

      // Assert
      verify(
        () => mockHttpClient.get(
          any(
            that: contains('/${mockGetCatByTagUsecaseParams.tag}'),
          ),
          queryParameters: any(
            named: 'queryParameters',
            that: containsPair('json', 'true'),
          ),
        ),
      ).called(1);
    });
    group('and the call is successful,', () {
      test('should return an [CatModel]', () async {
        //Arrange
        setUpMock200Response();

        //Act
        final result =
            await datasource.getCatByTag(mockGetCatByTagUsecaseParams);

        //Assert
        expect(result, isA<CatModel>());
      });
      test(
          'the returned model should have the tag, text, textColor and filter as it was passed by the params',
          () async {
        // Arrange
        setUpMock200Response();

        // Act
        final result =
            await datasource.getCatByTag(mockGetCatByTagUsecaseParams);

        // Assert
        expect(
          result,
          isA<CatModel>()
              .having(
                (catModel) => catModel.text,
                'text',
                mockGetCatByTagUsecaseParams.text.toNullable(),
              )
              .having(
                (catModel) => catModel.textColor,
                'textColor',
                mockGetCatByTagUsecaseParams.textColor.toNullable(),
              )
              .having(
                (catModel) => catModel.filter,
                'filter',
                mockGetCatByTagUsecaseParams.filter.toNullable(),
              )
              .having(
                (catModel) => catModel.tags,
                'tags',
                contains(mockGetCatByTagUsecaseParams.tag),
              ),
        );
        verify(() {
          final text = mockGetCatByTagUsecaseParams.text
              .fold(() => null, (text) => text);
          final textColor = mockGetCatByTagUsecaseParams.textColor
              .fold(() => null, (textColor) => textColor);
          final filter = mockGetCatByTagUsecaseParams.filter
              .fold(() => null, (filter) => filter);
          mockHttpClient.get(
              'https://cataas.com/cat/${mockGetCatByTagUsecaseParams.tag}/says/$text',
              queryParameters: {
                'json': 'true',
                'textColor': textColor,
                'filter': filter,
              });
        }).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('and the statusCode is 404, should throw a [CatNotFoundException]',
          () async {
        //Arrange
        setUpMock404Response();

        //Act
        final call = datasource.getCatByTag;

        //Assert
        expect(() => call(mockGetCatByTagUsecaseParams),
            throwsA(isA<CatNotFoundException>()));
      });
      test('and the status code is >= 500, should throw a [ServerException]',
          () {
        //Arrange
        setUpMock500Response();

        // Act
        final call = datasource.getCatByTag;

        //Assert
        expect(() => call(mockGetCatByTagUsecaseParams),
            throwsA(isA<ServerException>()));
      });
      test(
          'and the status code is not >= 500 or == 404, should throw an [ApiException]',
          () {
        // Arrange
        setUpMockDefaultErrorResponse();

        // Act
        final call = datasource.getCatByTag;

        // Assert
        expect(() => call(mockGetCatByTagUsecaseParams),
            throwsA(isA<ApiException>()));
      });
    });
  });
  group('When [getRandomCat] is called,', () {
    test('should perform a GET request on a url', () {
      // Arrange
      setUpMock200Response();

      // Act
      datasource.getRandomCat(mockGetRandomCatUsecaseParams);

      // Assert
      verify(
        () => mockHttpClient.get(
          any(),
          queryParameters: any(
            named: 'queryParameters',
            that: containsPair('json', 'true'),
          ),
        ),
      ).called(1);
    });
    group('and the call is successful,', () {
      test('should return an [CatModel]', () async {
        //Arrange
        setUpMock200Response();

        //Act
        final result =
            await datasource.getRandomCat(mockGetRandomCatUsecaseParams);

        //Assert
        expect(result, isA<CatModel>());
      });
      test(
          'the returned model should have the tag, text, textColor and filter as it was passed by the params',
          () async {
        // Arrange
        setUpMock200Response();

        // Act
        final result =
            await datasource.getRandomCat(mockGetRandomCatUsecaseParams);

        // Assert
        expect(
          result,
          isA<CatModel>()
              .having(
                (catModel) => catModel.text,
                'text',
                mockGetRandomCatUsecaseParams.text.toNullable(),
              )
              .having(
                (catModel) => catModel.textColor,
                'textColor',
                mockGetRandomCatUsecaseParams.textColor.toNullable(),
              )
              .having(
                (catModel) => catModel.filter,
                'filter',
                mockGetRandomCatUsecaseParams.filter.toNullable(),
              ),
        );
        verify(() {
          final text = mockGetRandomCatUsecaseParams.text.toNullable();
          final textColor =
              mockGetRandomCatUsecaseParams.textColor.toNullable();
          final filter = mockGetRandomCatUsecaseParams.filter.toNullable();
          mockHttpClient.get(
            'https://cataas.com/cat/says/$text',
            queryParameters: {
              'json': 'true',
              'textColor': textColor,
              'filter': filter,
            },
          );
        }).called(1);
      });
    });
    group('and the call is unsuccessful,', () {
      test('and the statusCode is 404, should throw a [CatNotFoundException]',
          () async {
        //Arrange
        setUpMock404Response();

        //Act
        final call = datasource.getRandomCat;

        //Assert
        expect(() => call(mockGetRandomCatUsecaseParams),
            throwsA(isA<CatNotFoundException>()));
      });
      test('and the status code is >= 500, should throw a [ServerException]',
          () {
        //Arrange
        setUpMock500Response();

        // Act
        final call = datasource.getRandomCat;

        //Assert
        expect(() => call(mockGetRandomCatUsecaseParams),
            throwsA(isA<ServerException>()));
      });
      test(
          'and the status code is not >= 500 or == 400, should throw an [ApiException]',
          () {
        // Arrange
        setUpMockDefaultErrorResponse();

        // Act
        final call = datasource.getRandomCat;

        // Assert
        expect(() => call(mockGetRandomCatUsecaseParams),
            throwsA(isA<ApiException>()));
      });
    });
  });
  group('When [getCatByIdOrTag] is called,', () {
    test('should perform a GET request on a url', () async {
      // Arrange
      setUpMock200Response();

      // Act
      datasource.getCatByIdOrTag(mockGetCatByIdOrTagUsecaseParams);

      // Assert
      verify(
        () => mockHttpClient.get(
          any(),
          queryParameters: any(
            named: 'queryParameters',
            that: containsPair('json', 'true'),
          ),
        ),
      ).called(1);
    });
    group('and the call is successful,', () {
      test('should return an [CatModel]', () async {
        //Arrange
        setUpMock200Response();

        //Act
        final result =
            await datasource.getCatByIdOrTag(mockGetCatByIdOrTagUsecaseParams);

        //Assert
        expect(result, isA<CatModel>());
      });
      test(
          'the returned model should have the tag, text, textColor and filter as it was passed by the params',
          () async {
        // Arrange
        setUpMock200Response();

        // Act
        final result =
            await datasource.getCatByIdOrTag(mockGetCatByIdOrTagUsecaseParams);

        // Assert
        expect(
          result,
          isA<CatModel>()
              .having(
                (catModel) => catModel.text,
                'text',
                mockGetCatByIdOrTagUsecaseParams.text.toNullable(),
              )
              .having(
                (catModel) => catModel.textColor,
                'textColor',
                mockGetCatByIdOrTagUsecaseParams.textColor.toNullable(),
              )
              .having(
                (catModel) => catModel.filter,
                'filter',
                mockGetCatByIdOrTagUsecaseParams.filter.toNullable(),
              ),
        );
        verify(() {
          final value = mockGetCatByIdOrTagUsecaseParams.value;
          final text = mockGetCatByIdOrTagUsecaseParams.text.toNullable();
          final textColor = mockGetCatByIdOrTagUsecaseParams.textColor.toNullable();
          final filter = mockGetCatByIdOrTagUsecaseParams.filter.toNullable();
          mockHttpClient.get(
            'https://cataas.com/cat/$value/says/$text',
            queryParameters: {
              'json': 'true',
              'textColor': textColor,
              'filter': filter,
            },
          );
        }).called(1);
      });
    });

    group('and the call is unsuccessful,', () {
      test('and the statusCode is 404, should throw a [CatNotFoundException]',
          () async {
        //Arrange
        setUpMock404Response();

        //Act
        final call = datasource.getCatByIdOrTag;

        //Assert
        expect(() => call(mockGetCatByIdOrTagUsecaseParams),
            throwsA(isA<CatNotFoundException>()));
      });
      test('and the status code is >= 500, should throw a [ServerException]',
          () {
        //Arrange
        setUpMock500Response();

        // Act
        final call = datasource.getCatByIdOrTag;

        //Assert
        expect(() => call(mockGetCatByIdOrTagUsecaseParams),
            throwsA(isA<ServerException>()));
      });
      test(
          'and the status code is not >= 500 or == 400, should throw an [ApiException]',
          () {
        // Arrange
        setUpMockDefaultErrorResponse();

        // Act
        final call = datasource.getCatByIdOrTag;

        // Assert
        expect(() => call(mockGetCatByIdOrTagUsecaseParams),
            throwsA(isA<ApiException>()));
      });
    });
  });
  group('When [shareCat] is called,', () {
    group('and the call is sucessful,', () {
      test('should return a [null]', () async {
        //Arrange
        when(
          () => mockShareImageService(url: any(named: 'url')),
        ).thenAnswer((_) async {});

        //Act
        await datasource.shareCat(mockShareCatUsecaseParams);

        //Assert
        verify(
          () => mockShareImageService(url: any(named: 'url')),
        ).called(1);
        expect(
          () async => datasource.shareCat(mockShareCatUsecaseParams),
          isA<void>(),
        );
      });
    });
    group('and the call is unsuccessful,', () {
      test('should throw a [ShareCatException]', () async {
        //Arrange
        when(
          () => mockShareImageService(url: any(named: 'url')),
        ).thenThrow(mockShareCatException);

        //Act
        final call = datasource.shareCat;

        //Assert
        expect(
          () async => call(mockShareCatUsecaseParams),
          throwsA(isA<ShareCatException>()),
        );
      });
    });
  });
}
