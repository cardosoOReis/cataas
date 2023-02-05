import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class MockICatRepository extends Mock implements ICatRepository {}

class MockRemoteDatasource extends Mock implements ICatRemoteDatasource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

class MockFailure extends Mock implements Failure {}

class MockApiFailure extends Mock implements ApiFailure {}

final mockCatEntity = CatEntity(
  id: '',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const None(),
);

final mockCatModel = CatModel(
  id: '',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const None(),
);

final mockFailure = MockFailure();
final mockNoInternetConnectionFailure = NoInternetConnectionFailure();
const mockCatNotFoundException = CatNotFoundException(message: '', code: 0);
const mockParseDataException = ParseDataException(body: {});

const Option<String> mockOptionString = Some('');

const mockGetRandomCatUsecaseParams = GetRandomCatUsecaseParams(
  text: None(),
  textColor: None(),
  filter: None(),
);
const mockGetCatByIdUsecaseParams = GetCatByIdUsecaseParams(
  id: '',
  text: None(),
  textColor: None(),
  filter: None(),
);
const mockGetCatByTagUsecaseParams = GetCatByTagUsecaseParams(
  tag: '',
  text: None(),
  textColor: None(),
  filter: None(),
);
