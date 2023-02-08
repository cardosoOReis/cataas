import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/core/services/i_save_image_locally_service.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_local_datasource.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/save_cat_locally_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRandomCatUsecase extends Mock implements GetRandomCatUsecase {}

class MockGetCatByIdUsecase extends Mock implements GetCatByIdUsecase {}

class MockGetCatByTagUsecase extends Mock implements GetCatByTagUsecase {}

class MockICatRepository extends Mock implements ICatRepository {}

class MockRemoteDatasource extends Mock implements ICatRemoteDatasource {}

class MockLocalDatasource extends Mock implements ICatLocalDatasource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

class MockFailure extends Mock implements Failure {}

class MockApiFailure extends Mock implements ApiFailure {}

class MockSaveImageLocallyService extends Mock
    implements ISaveImageLocallyService {}

class MockHttpClient extends Mock implements Dio {}

final mockCatEntity = CatEntity(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const None(),
);

final mockCatModel = CatModel(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const None(),
);

final mockCatModelFromResponse = CatModel(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const Some(['cute', 'sunshi']),
);

final mockFailure = MockFailure();
final mockNoInternetConnectionFailure = NoInternetConnectionFailure();
const mockCatNotFoundException =
    CatNotFoundException(message: '', statusCode: 0);
const mockParseDataException = ParseDataException(body: {});
const mockSaveCatLocallyException = SaveCatLocallyException();
const mockServerException = ServerException(message: '', statusCode: 0);

const Option<String> mockOptionString = Some('');

const mockGetRandomCatUsecaseParams = GetRandomCatUsecaseParams(
  text: Some('hello'),
  textColor: Some('red'),
  filter: Some('sepia'),
);
const mockGetCatByIdUsecaseParams = GetCatByIdUsecaseParams(
  id: 'exvMtoKhGj3R7FGL',
  text: Some('hello'),
  textColor: Some('red'),
  filter: Some('sepia'),
);
const mockGetCatByTagUsecaseParams = GetCatByTagUsecaseParams(
  tag: 'sunshi',
  text: Some('hello'),
  textColor: Some('red'),
  filter: Some('sepia'),
);

const mockSaveCatLocallyUsecaseParams = SaveCatLocallyUsecaseParams(url: '');
