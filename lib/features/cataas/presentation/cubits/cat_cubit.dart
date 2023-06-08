import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/extensions/dartz_extensions.dart';
import '../../domain/entities/cat.dart';
import '../usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../usecases/i_get_random_cat_usecase.dart';
import '../utils/app_strings.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final IGetRandomCatUsecase _getRandomCatUsecase;
  final IGetCatByIdOrTagUsecase _getCatByIdOrTagUsecase;
  CatCubit({
    required IGetRandomCatUsecase getRandomCatUsecase,
    required IGetCatByIdOrTagUsecase getCatByIdOrTagUsecase,
  })  : _getCatByIdOrTagUsecase = getCatByIdOrTagUsecase,
        _getRandomCatUsecase = getRandomCatUsecase,
        super(const CatState());
  String? _text;
  String? _textColor;
  String? _filter;

  Future<void> onInit() async {
    await getWelcomeCat();
  }

  Future<void> getWelcomeCat() async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: Some(AppStrings.initialCatText),
      textColor: const None(),
      filter: const None(),
    );
    final result = await _getRandomCatUsecase(params);
    _foldCatOrFailure(result);
  }

  Future<void> onGetRandomCatButtonTap() async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await _getRandomCatUsecase(params);
    _foldCatOrFailure(result);
  }

  Future<void> onGetCatByIdOrTagButtonTap(String value) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetCatByIdOrTagUsecaseParams(
      value: value,
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await _getCatByIdOrTagUsecase(params);
    _foldCatOrFailure(result);
  }

  void onTextTextFieldValueChanged(String? text) {
    _text = text;
  }

  void onFilterTextFieldValueChanged(String? text) {
    _filter = text;
  }

  void _foldCatOrFailure(Either<Failure, Cat> result) {
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CatStatus.failure,
          failure: failure,
        ));
      },
      (catEntity) {
        emit(state.copyWith(
          status: CatStatus.success,
          catEntity: catEntity,
        ));
      },
    );
  }
}
