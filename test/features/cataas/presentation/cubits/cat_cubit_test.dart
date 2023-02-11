import 'package:bloc_test/bloc_test.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late CatCubit cubit;
  late MockGetCatByIdUsecase mockGetCatByIdUsecase;
  late MockGetCatByTagUsecase mockGetCatByTagUsecase;
  late MockGetRandomCatUsecase mockGetRandomCatUsecase;
  late MockOpenUrlOnBrowser mockOpenUrlOnBrowserService;

  setUp(() {
    registerFallbackValue(mockGetRandomCatUsecaseParams);
    registerFallbackValue(mockGetCatByIdUsecaseParams);
    registerFallbackValue(mockGetCatByTagUsecaseParams);
    mockGetCatByIdUsecase = MockGetCatByIdUsecase();
    mockGetCatByTagUsecase = MockGetCatByTagUsecase();
    mockGetRandomCatUsecase = MockGetRandomCatUsecase();
    mockOpenUrlOnBrowserService = MockOpenUrlOnBrowser();
    cubit = CatCubit(
      getRandomCatUsecase: mockGetRandomCatUsecase,
      getCatByIdUsecase: mockGetCatByIdUsecase,
      getCatByTagUsecase: mockGetCatByTagUsecase,
      openUrlOnBrowserService: mockOpenUrlOnBrowserService,
    );
  });

  group('When [onGetRandomCatButtonTap] is called,', () {
    group('and the call is success,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, success] when getRandomCatUsecase returns a [CatEntity].',
        setUp: () {
          when(() => mockGetRandomCatUsecase(any()))
              .thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetRandomCatButtonTap(),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.success,
              )
              .having(
                (state) => state.catEntity,
                'catEntity',
                mockCatEntity,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                true,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetRandomCatUsecase(any()),
          ).called(1);
        },
      );
      blocTest<CatCubit, CatState>(
        'emits [loading, failure] when getRandomCatUsecase returns a [Failure].',
        setUp: () {
          when(() => mockGetRandomCatUsecase(any()))
              .thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetRandomCatButtonTap(),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.failure,
              )
              .having(
                (state) => state.failure,
                'failure',
                mockFailure,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                false,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetRandomCatUsecase(any()),
          ).called(1);
        },
      );
    });
  });
  group('When [onGetCatByIdButtonTap] is called,', () {
    group('and the call is success,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, success] when getRandomCatUsecase returns a [CatEntity].',
        setUp: () {
          when(() => mockGetCatByIdUsecase(any()))
              .thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetCatByIdButtonTap(''),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.success,
              )
              .having(
                (state) => state.catEntity,
                'catEntity',
                mockCatEntity,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                true,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetCatByIdUsecase(any()),
          ).called(1);
        },
      );
      blocTest<CatCubit, CatState>(
        'emits [loading, failure] when getRandomCatUsecase returns a [Failure].',
        setUp: () {
          when(() => mockGetCatByIdUsecase(any()))
              .thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetCatByIdButtonTap(''),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.failure,
              )
              .having(
                (state) => state.failure,
                'failure',
                mockFailure,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                false,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetCatByIdUsecase(any()),
          ).called(1);
        },
      );
    });
  });
  group('When [onGetCatByTagButtonTap] is called,', () {
    group('and the call is success,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, success] when getRandomCatUsecase returns a [CatEntity].',
        setUp: () {
          when(() => mockGetCatByTagUsecase(any()))
              .thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetCatByTagButtonTap(''),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.success,
              )
              .having(
                (state) => state.catEntity,
                'catEntity',
                mockCatEntity,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                true,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetCatByTagUsecase(any()),
          ).called(1);
        },
      );
      blocTest<CatCubit, CatState>(
        'emits [loading, failure] when getRandomCatUsecase returns a [Failure].',
        setUp: () {
          when(() => mockGetCatByTagUsecase(any()))
              .thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetCatByTagButtonTap(''),
        expect: () => <dynamic>[
          const CatState(status: CatStatus.loading),
          isA<CatState>()
              .having(
                (state) => state.status,
                'status',
                CatStatus.failure,
              )
              .having(
                (state) => state.failure,
                'failure',
                mockFailure,
              )
              .having(
                (state) => state.isSaveCatButtonEnabled,
                'isSaveCatButtonEnabled',
                false,
              ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetCatByTagUsecase(any()),
          ).called(1);
        },
      );
    });
  });
}
