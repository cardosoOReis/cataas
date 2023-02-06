import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/features/cataas/data/datasources/implementations/cat_remote_datasource_impl.dart';
import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../mocks.dart';

void main() {
  late CatRemoteDatasourceImpl datasource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    datasource = CatRemoteDatasourceImpl(client: mockDio);
  });

  void setUpMock200Response() {
    when(
      () => mockDio.get(
        any(),
        queryParameters: any(
          named: 'queryParameters',
        ),
      ),
    ).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: fixture('cat.json'),
          statusCode: 200,
        ));
  }

  void setUpMock404Response() {
    when(
      () => mockDio.get(
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
      () => mockDio.get(
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

  void setUpMockDefaultResponse() {
    when(
      () => mockDio.get(
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
        () => mockDio.get(
          'https://cataas.com/cat/${mockGetCatByIdUsecaseParams.id}',
          queryParameters: {
            'json': 'true',
          },
        ),
      ).called(1);
    });
    group('and the call is sucessful,', () {
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
                    (p0) => p0.text, 'text', mockGetCatByIdUsecaseParams.text)
                .having((p0) => p0.textColor, 'textColor',
                    mockGetCatByIdUsecaseParams.textColor)
                .having((p0) => p0.filter, 'filter',
                    mockGetCatByIdUsecaseParams.filter));
        verify(() {
          final text =
              mockGetCatByIdUsecaseParams.text.fold(() => null, (text) => text);
          final textColor = mockGetCatByIdUsecaseParams.textColor
              .fold(() => null, (textColor) => textColor);
          final filter = mockGetCatByIdUsecaseParams.filter
              .fold(() => null, (filter) => filter);
          mockDio.get(
              'https://cataas.com/cat/${mockGetCatByIdUsecaseParams.id}/says/$text',
              queryParameters: {
                'json': 'true',
                'textColor': textColor,
                'filter': filter,
              });
        }).called(1);
      });
    });
    group('and the call is unsucessful,', () {
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
          'and the status code is not >= 500 or == 400, should throw an [ApiException]',
          () {
        // Arrange
        setUpMockDefaultResponse();

        // Act
        final call = datasource.getCatById;

        // Assert
        expect(() => call(mockGetCatByIdUsecaseParams),
            throwsA(isA<ApiException>()));
      });
    });
  });
}
