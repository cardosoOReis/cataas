import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../configs/app_strings.dart';
import '../../domain/entities/cat.dart';
import '../../domain/entities/filters.dart';
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
        super(const CatInitial());
  final textController = TextEditingController();
  Filters currentFilter = Filters.none;

  @override
  Future<void> close() async {
    textController.dispose();
    await super.close();
  }

  Option<String> get textControllerValue =>
      textController.text.isNotEmpty ? some(textController.text) : none();

  Future<void> onInit() async => getWelcomeCat();

  Future<void> getWelcomeCat() async {
    emit(const CatLoading());
    const params = GetRandomCatUsecaseParams(
      text: Some(AppStrings.initialCatText),
      textColor: None(),
      filter: None(),
    );
    final result = await _getRandomCatUsecase(params);
    emit(_foldCatOrFailure(result));
  }

  Future<void> onGetRandomCatButtonTap() async {
    emit(const CatLoading());
    final params = GetRandomCatUsecaseParams(
      text: textControllerValue,
      textColor: const Option.none(),
      filter: Option.fromNullable(currentFilter),
    );
    final result = await _getRandomCatUsecase(params);
    emit(_foldCatOrFailure(result));
  }

  Future<void> onGetCatByIdOrTagButtonTap(String value) async {
    emit(const CatLoading());
    final params = GetCatByIdOrTagUsecaseParams(
      value: value,
      text: textControllerValue,
      textColor: const Option.none(),
      filter: Option.fromNullable(currentFilter),
    );
    final result = await _getCatByIdOrTagUsecase(params);
    emit(_foldCatOrFailure(result));
  }

  void onFilterTextFieldValueChanged(Filters filter) {
    currentFilter = filter;
  }

  CatState _foldCatOrFailure(Either<Failure, Cat> result) => result.fold(
        (failure) => CatFailure(failure: failure),
        (cat) => CatSuccess(cat: cat),
      );
}
