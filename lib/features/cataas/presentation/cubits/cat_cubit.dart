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
        super(const CatInitial());
  String? _text;
  String? _filter;

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
      text: optionOf(_text),
      textColor: const Option.none(),
      filter: optionOf(_filter),
    );
    final result = await _getRandomCatUsecase(params);
    emit(_foldCatOrFailure(result));
  }

  Future<void> onGetCatByIdOrTagButtonTap(String value) async {
    emit(const CatLoading());
    final params = GetCatByIdOrTagUsecaseParams(
      value: value,
      text: optionOf(_text),
      textColor: const Option.none(),
      filter: optionOf(_filter),
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

  CatState _foldCatOrFailure(Either<Failure, Cat> result) => result.fold(
        (failure) => CatFailure(failure: failure),
        (cat) => CatSuccess(cat: cat),
      );
}
