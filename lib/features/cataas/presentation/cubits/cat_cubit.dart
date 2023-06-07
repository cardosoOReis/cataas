import 'package:bloc/bloc.dart';
import 'package:cataas/features/cataas/presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/extensions/dartz_extensions.dart';
import '../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../domain/entities/cat.dart';
import '../usecases/i_get_cat_by_id_usecase.dart';
import '../usecases/i_get_cat_by_tag_usecase.dart';
import '../usecases/i_get_random_cat_usecase.dart';
import '../usecases/i_save_cat_locally_usecase.dart';
import '../usecases/i_share_cat_usecase.dart';
import '../utils/app_strings.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final IGetRandomCatUsecase _getRandomCatUsecase;
  final IGetCatByIdUsecase _getCatByIdUsecase;
  final IGetCatByTagUsecase _getCatByTagUsecase;
  final IGetCatByIdOrTagUsecase _getCatByIdOrTagUsecase;
  final ISaveCatLocallyUsecase _saveCatLocallyUsecase;
  final IShareCatUsecase _shareCatUsecase;
  final IOpenUrlOnBrowserService _openUrlOnBrowserService;
  CatCubit({
    required IGetRandomCatUsecase getRandomCatUsecase,
    required IGetCatByIdUsecase getCatByIdUsecase,
    required IGetCatByTagUsecase getCatByTagUsecase,
    required IGetCatByIdOrTagUsecase getCatByIdOrTagUsecase,
    required ISaveCatLocallyUsecase saveCatLocallyUsecase,
    required IShareCatUsecase shareCatUsecase,
    required IOpenUrlOnBrowserService openUrlOnBrowserService,
  })  : _openUrlOnBrowserService = openUrlOnBrowserService,
        _shareCatUsecase = shareCatUsecase,
        _saveCatLocallyUsecase = saveCatLocallyUsecase,
        _getCatByIdOrTagUsecase = getCatByIdOrTagUsecase,
        _getCatByTagUsecase = getCatByTagUsecase,
        _getCatByIdUsecase = getCatByIdUsecase,
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

  Future<void> onGetCatByIdButtonTap(String id) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetCatByIdUsecaseParams(
      id: id,
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await _getCatByIdUsecase(params);
    _foldCatOrFailure(result);
  }

  Future<void> onGetCatByTagButtonTap(String tag) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetCatByTagUsecaseParams(
      tag: tag,
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await _getCatByTagUsecase(params);
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

  Future<void> onSaveCatIconTap(String url) async {
    emit(state.copyWith(savingCatStatus: CatStatus.loading));
    final result =
        await _saveCatLocallyUsecase(SaveCatLocallyUsecaseParams(url: url));
    result.fold(
      (_) {
        emit(
          state.copyWith(
            savingCatStatus: CatStatus.failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            savingCatStatus: CatStatus.success,
          ),
        );
      },
    );
  }

  Future<void> onShareCatIconTap(String url) async {
    emit(state.copyWith(shareCatStatus: CatStatus.loading));
    final result = await _shareCatUsecase(ShareCatUsecaseParams(url: url));
    result.fold(
      (_) {
        emit(
          state.copyWith(
            shareCatStatus: CatStatus.failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            shareCatStatus: CatStatus.success,
          ),
        );
      },
    );
  }

  void onTextTextFieldValueChanged(String? text) {
    _text = text;
  }

  void onFilterTextFieldValueChanged(String? text) {
    _filter = text;
  }

  void onBeerIconTap() {
    _openUrlOnBrowserService(AppStrings.buyMeABeerUrl);
  }

  void onTwitterIconTap() {
    _openUrlOnBrowserService(AppStrings.twitterUrl);
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
