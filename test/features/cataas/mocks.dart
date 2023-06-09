import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/core/error/failures.dart';
import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import 'package:cataas/core/services/save_image_locally/i_save_image_locally_service.dart';
import 'package:cataas/core/services/share_image/i_share_image_service.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_local_datasource.dart';
import 'package:cataas/features/cataas/data/datasources/i_cat_remote_datasource.dart';
import 'package:cataas/features/cataas/data/models/cat_model.dart';
import 'package:cataas/features/cataas/domain/entities/cat.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase_impl.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_tag_usecase_impl.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase_impl.dart';
import 'package:cataas/features/cataas/domain/usecases/save_cat_locally_usecase_impl.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/show_toast_atom/i_show_toast_atom.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_get_cat_by_tag_usecase.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_get_random_cat_usecase.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_save_cat_locally_usecase.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_share_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRandomCatUsecase extends Mock implements GetRandomCatUsecaseImpl {}

class MockGetCatByIdUsecase extends Mock implements GetCatByIdUsecaseImpl {}

class MockGetCatByTagUsecase extends Mock implements GetCatByTagUsecaseImpl {}

class MockGetCatByIdOrTagUsecase extends Mock
    implements IGetCatByIdOrTagUsecase {}

class MockSaveCatLocallyUsecase extends Mock
    implements SaveCatLocallyUsecaseImpl {}

class MockShareCatUsecase extends Mock implements IShareCatUsecase {}

class MockICatRepository extends Mock implements ICatRepository {}

class MockRemoteDatasource extends Mock implements ICatRemoteDatasource {}

class MockLocalDatasource extends Mock implements ICatLocalDatasource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

class MockOpenUrlOnBrowser extends Mock implements IOpenUrlOnBrowserService {}

class MockFailure extends Mock implements Failure {}

class MockApiFailure extends Mock implements ApiFailure {}

class MockSaveImageLocallyService extends Mock
    implements ISaveImageLocallyService {}

class MockShareImageService extends Mock implements IShareImageService {}

class MockHttpClient extends Mock implements Dio {}

class MockBuildContext extends Mock implements BuildContext {}

class MockShowToastAtom extends Mock implements IShowToastAtom {}

final mockCatEntity = Cat(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  tags: const [],
);

final mockCatModel = CatModel(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  tags: const [],
);

final mockCatModelFromResponse = CatModel(
  id: 'exvMtoKhGj3R7FGL',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  url: '/cat/exvMtoKhGj3R7FGL',
  tags: const ['cute', 'sunshi'],
);

final mockFailure = MockFailure();
const mockNoInternetConnectionFailure = NoInternetConnectionFailure();
const mockCatNotFoundException = CatNotFoundException(statusCode: 0);
const mockParseDataException = ParseDataException(body: {});
const mockSaveCatLocallyException = SaveCatLocallyException();
const mockServerException = ServerException(message: '', statusCode: 0);
const mockShareCatException = ShareCatException();

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
const mockGetCatByIdOrTagUsecaseParams = GetCatByIdOrTagUsecaseParams(
  value: 'value',
  text: Some('text'),
  textColor: Some('textColor'),
  filter: Some('filter'),
);

const mockSaveCatLocallyUsecaseParams = SaveCatLocallyUsecaseParams(url: '');

const mockShareCatUsecaseParams = ShareCatUsecaseParams(url: 'url');

const mockCatToast = CatToastAtom(
  text: '',
  icon: Icon(null),
  color: Color(0x00000000),
);

final mockBuildContext = MockBuildContext();