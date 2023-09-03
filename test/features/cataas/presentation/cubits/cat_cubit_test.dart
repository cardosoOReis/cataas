// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc_test/bloc_test.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late CatCubit cubit;
  late MockGetRandomCatUsecase mockGetRandomCatUsecase;
  late MockGetCatByIdOrTagUsecase mockGetCatByIdOrTagUsecase;

  setUp(() {
    registerFallbackValue(mockGetRandomCatUsecaseParams);
    registerFallbackValue(mockGetCatByIdOrTagUsecaseParams);
    mockGetRandomCatUsecase = MockGetRandomCatUsecase();
    mockGetCatByIdOrTagUsecase = MockGetCatByIdOrTagUsecase();
    cubit = CatCubit(
      getRandomCatUsecase: mockGetRandomCatUsecase,
      getCatByIdOrTagUsecase: mockGetCatByIdOrTagUsecase,
    );
  });

  group('When [onGetRandomCatButtonTap] is called,', () {
    group('and the call is success,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, success] when getRandomCatUsecase returns a [CatEntity].',
        setUp: () {
          when(
            () => mockGetRandomCatUsecase(any()),
          ).thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetRandomCatButtonTap(),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatSuccess>().having(
            (state) => state.cat,
            'cat',
            mockCatEntity,
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
          when(
            () => mockGetRandomCatUsecase(any()),
          ).thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetRandomCatButtonTap(),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatFailure>().having(
            (state) => state.failure,
            'failure',
            mockFailure,
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
  group('When [getCatByIdOrTag] is called,', () {
    group('and the call is successful,', () {
      blocTest<CatCubit, CatState>(
        'emits [loading, sucess] when [getCatByIdOrTagUsecase] returns a CatEntity',
        setUp: () {
          when(
            () => mockGetCatByIdOrTagUsecase(any()),
          ).thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (_) => cubit.onGetCatByIdOrTagButtonTap(''),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatSuccess>().having(
            (state) => state.cat,
            'cat',
            mockCatEntity,
          ),
        ],
        verify: (_) {
          verify(
            () => mockGetCatByIdOrTagUsecase(any()),
          ).called(1);
        },
      );
      blocTest<CatCubit, CatState>(
        'emits [loading, failure] when getCatByIdOrTagUsecase returns a [Failure].',
        setUp: () {
          when(
            () => mockGetCatByIdOrTagUsecase(any()),
          ).thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.onGetCatByIdOrTagButtonTap(''),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatFailure>().having(
            (state) => state.failure,
            'failure',
            mockFailure,
          ),
        ],
        verify: (bloc) {
          verify(
            () => mockGetCatByIdOrTagUsecase(any()),
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
          when(
            () => mockGetRandomCatUsecase(any()),
          ).thenAnswer((_) async => Right(mockCatEntity));
        },
        build: () => cubit,
        act: (bloc) => bloc.getWelcomeCat(),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatSuccess>().having(
            (state) => state.cat,
            'cat',
            mockCatEntity,
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
          when(
            () => mockGetRandomCatUsecase(any()),
          ).thenAnswer((_) async => Left(mockFailure));
        },
        build: () => cubit,
        act: (bloc) => bloc.getWelcomeCat(),
        expect: () => <Matcher>[
          isA<CatLoading>(),
          isA<CatFailure>().having(
            (state) => state.failure,
            'failure',
            mockFailure,
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
}
