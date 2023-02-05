import 'package:cataas/core/error/failures.dart';
import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:cataas/features/cataas/domain/repositories/i_cat_repository.dart';
import 'package:cataas/features/cataas/domain/usecases/get_cat_by_id_usecase.dart';
import 'package:cataas/features/cataas/domain/usecases/get_random_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class MockICatRepository extends Mock implements ICatRepository {}

class MockFailure extends Mock implements Failure {}

final mockCatEntity = CatEntity(
  id: '',
  fileType: FileType.image,
  requestedAt: DateTime(2023),
  text: const None(),
  textColor: const None(),
  filter: const None(),
  tags: const None(),
);

final mockFailure = MockFailure();

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
