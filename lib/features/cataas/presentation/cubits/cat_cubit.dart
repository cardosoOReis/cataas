import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../configs/app_strings.dart';
import '../../domain/entities/cat.dart';
import '../usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../usecases/i_get_random_cat_usecase.dart';

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
    const params = GetRandomCatUsecaseParams(
      text: Some(AppStrings.initialCatText),
      textColor: None(),
      filter: None(),
    );
    final result = await _getRandomCatUsecase(params);
    emit(_foldCatOrFailure(result));
  }

  Future<void> onGetRandomCatButtonTap() async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await _getRandomCatUsecase(params);
    emit(_foldCatOrFailure(result));
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
    emit(_foldCatOrFailure(result));
  }

  void onTextTextFieldValueChanged(String? text) {
    _text = text;
  }

  void onFilterTextFieldValueChanged(String? text) {
    _filter = text;
  }

  CatState _foldCatOrFailure(Either<Failure, Cat> result) {
    return result.fold(
      (failure) => state.copyWith(
        status: CatStatus.failure,
        failure: failure,
      ),
      (cat) => state.copyWith(
        status: CatStatus.success,
        catEntity: cat,
      ),
    );
  }
}
