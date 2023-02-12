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
  late MockSaveCatLocallyUsecase mockSaveCatLocallyUsecase;
  late MockShareCatUsecase mockShareCatUsecase;
  late MockOpenUrlOnBrowser mockOpenUrlOnBrowserService;

  setUp(() {
    registerFallbackValue(mockGetRandomCatUsecaseParams);
    registerFallbackValue(mockGetCatByIdUsecaseParams);
    registerFallbackValue(mockGetCatByTagUsecaseParams);
    registerFallbackValue(mockSaveCatLocallyUsecaseParams);
    registerFallbackValue(mockShareCatUsecaseParams);
    mockGetCatByIdUsecase = MockGetCatByIdUsecase();
    mockGetCatByTagUsecase = MockGetCatByTagUsecase();
    mockGetRandomCatUsecase = MockGetRandomCatUsecase();
    mockOpenUrlOnBrowserService = MockOpenUrlOnBrowser();
    mockSaveCatLocallyUsecase = MockSaveCatLocallyUsecase();
    mockShareCatUsecase = MockShareCatUsecase();
    cubit = CatCubit(
      getRandomCatUsecase: mockGetRandomCatUsecase,
      getCatByIdUsecase: mockGetCatByIdUsecase,
      getCatByTagUsecase: mockGetCatByTagUsecase,
      openUrlOnBrowserService: mockOpenUrlOnBrowserService,
      shareCatUsecase: mockShareCatUsecase,
      saveCatLocallyUsecase: mockSaveCatLocallyUsecase,
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
        'emits [loading, success] when getCatByIdUsecase returns a [CatEntity].',
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
        'emits [loading, failure] when getCatByIdUsecase returns a [Failure].',
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
        'emits [loading, success] when getCatByTagUsecase returns a [CatEntity].',
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
        'emits [loading, failure] when getCatByTagUsecase returns a [Failure].',
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
  group('When [getWelcomeCat] is called,', () {
    group('and the call is success,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, success] when getRandomCatUsecase returns a [CatEntity].',
        setUp: () {
          when(() => mockGetRandomCatUsecase(any()))
              .thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.getWelcomeCat(),
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
        act: (bloc) => bloc.getWelcomeCat(),
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
  group('When [onSaveCatIconTap] is called,', () {
    group('and the call is successful,', () {
      blocTest(
        'emits [loading, success] when saveCatLocallyUsecase returns a [void]',
        setUp: () {
          when(
            () => mockSaveCatLocallyUsecase(any()),
          ).thenAnswer((_) async => const Right(null));
        },
        build: () => cubit,
        act: (bloc) => bloc.onSaveCatIconTap(''),
        expect: () => <Matcher>[
          isA<CatState>().having(
            (state) => state.savingCatStatus,
            'savingCatStatus',
            CatStatus.loading,
          ),
          isA<CatState>().having(
            (state) => state.savingCatStatus,
            'SavingCatStatus',
            CatStatus.success,
          ),
        ],
        verify: (_) {
          verify(
            () => mockSaveCatLocallyUsecase(any()),
          ).called(1);
        },
      );
      blocTest(
        'emits [loading, failure] when saveCatLocallyUsecase returns a [Failure]',
        setUp: () {
          when(
            () => mockSaveCatLocallyUsecase(any()),
          ).thenAnswer((_) async => Left(MockFailure()));
        },
        build: () => cubit,
        act: (bloc) => bloc.onSaveCatIconTap(''),
        expect: () => <Matcher>[
          isA<CatState>().having(
            (state) => state.savingCatStatus,
            'savingCatStatus',
            CatStatus.loading,
          ),
          isA<CatState>().having(
            (state) => state.savingCatStatus,
            'SavingCatStatus',
            CatStatus.failure,
          ),
        ],
        verify: (_) {
          verify(
            () => mockSaveCatLocallyUsecase(any()),
          ).called(1);
        },
      );
    });
  });
}
