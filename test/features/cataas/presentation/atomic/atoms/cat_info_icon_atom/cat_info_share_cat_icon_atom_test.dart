import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_info_icon_atom/cat_info_share_cat_icon_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_failure_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/show_toast_atom/i_show_toast_atom.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_share_cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late CatInfoShareCatIconAtom atom;
  late IShareCatUsecase mockUsecase;
  late IShowToastAtom mockShowToastAtom;
  late String mockUrl;
  late MockBuildContext mockContext;
  setUp(() {
    registerFallbackValue(mockShareCatUsecaseParams);
    registerFallbackValue(mockCatToast);
    registerFallbackValue(mockBuildContext);
    mockUsecase = MockShareCatUsecase();
    mockShowToastAtom = MockShowToastAtom();
    mockUrl = '';
    mockContext = MockBuildContext();
    atom = CatInfoShareCatIconAtom(
      usecase: mockUsecase,
      showToastAtom: mockShowToastAtom,
      url: mockUrl,
      context: mockContext,
    );
  });

  group('When [onTap] is called,', () {
    setUp(() {
      when(() => mockContext.mounted).thenReturn(true);
      when(
        () => mockShowToastAtom(
          context: any(named: 'context'),
          toast: any(named: 'toast'),
        ),
      ).thenReturn(null);
    });
    group('and the call to save is successful,', () {
      test('should not show any toast', () async {
        //Arrange
        when(() => mockUsecase(any()))
            .thenAnswer((_) async => const Right(null));

        //Act
        await atom.onTap();

        //Assert
        verify(() => mockUsecase(any())).called(1);
        verifyZeroInteractions(mockShowToastAtom);
      });
    });
    group('and the call to save is unsuccessful,', () {
      test('should show a CatToastFailure', () async {
        //Arrange
        when(() => mockUsecase(any()))
            .thenAnswer((_) async => Left(mockFailure));

        //Act
        await atom.onTap();

        //Assert
        verify(() => mockUsecase(any())).called(1);
        verify(
          () => mockShowToastAtom(
            context: any(named: 'context'),
            toast: any(named: 'toast', that: isA<CatToastFailureAtom>()),
          ),
        ).called(1);
      });
    });
  });
}
