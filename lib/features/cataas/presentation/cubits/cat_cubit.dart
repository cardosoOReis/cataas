import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../api_endpoints.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/extensions/dartz_extensions.dart';
import '../../../../core/services/i_open_url_on_browser_service.dart';
import '../../domain/entities/cat_entity.dart';
import '../usecases/i_get_cat_by_id_usecase.dart';
import '../usecases/i_get_cat_by_tag_usecase.dart';
import '../usecases/i_get_random_cat_usecase.dart';
import '../utils/app_strings.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final IGetRandomCatUsecase getRandomCatUsecase;
  final IGetCatByIdUsecase getCatByIdUsecase;
  final IGetCatByTagUsecase getCatByTagUsecase;
  final IOpenUrlOnBrowserService openUrlOnBrowserService;
  CatCubit({
    required this.getRandomCatUsecase,
    required this.getCatByIdUsecase,
    required this.getCatByTagUsecase,
    required this.openUrlOnBrowserService,
  }) : super(const CatState());
  String? _text;
  String? _textColor;
  String? _filter;

  Future<void> onInit() async {
    await _getWelcomeCat();
  }

  Future<void> _getWelcomeCat() async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: Some(AppStrings.initialCatText),
      textColor: const None(),
      filter: const None(),
    );
    final result = await getRandomCatUsecase(params);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: CatStatus.failure,
            failure: failure,
          ),
        );
      },
      (catEntity) {
        emit(
          state.copyWith(
            status: CatStatus.success,
            catEntity: catEntity,
          ),
        );
      },
    );
  }

  Future<void> onGetRandomCatButtonTap() async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: _text.toOption(),
      textColor: _textColor.toOption(),
      filter: _filter.toOption(),
    );
    final result = await getRandomCatUsecase(params);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CatStatus.failure,
          failure: failure,
        ));
      },
      (catEntity) {
        emit(
          state.copyWith(
            status: CatStatus.success,
            catEntity: catEntity,
          ),
        );
      },
    );
  }

  Future<void> onGetCatByIdButtonTap(
    String id, {
    String? text,
    String? textColor,
    String? filter,
  }) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetCatByIdUsecaseParams(
      id: id,
      text: text.toOption(),
      textColor: textColor.toOption(),
      filter: filter.toOption(),
    );
    final result = await getCatByIdUsecase(params);
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

  Future<void> onGetCatByTagButtonTap(
    String tag, {
    String? text,
    String? textColor,
    String? filter,
  }) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetCatByTagUsecaseParams(
      tag: tag,
      text: text.toOption(),
      textColor: textColor.toOption(),
      filter: filter.toOption(),
    );
    final result = await getCatByTagUsecase(params);
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

  void onTextTextFieldValueChanged(String? text) {
    _text = text;
  }

  void onTextColorTextFieldValueChanged(String? text) {
    _textColor = text;
  }

  void onFilterTextFieldValueChanged(String? text) {
    _filter = text;
  }

  void onBeerIconTap() {
    openUrlOnBrowserService(ApiEndpoints.buyMeABeer());
  }

  void onTwitterIconTap() {
    openUrlOnBrowserService(ApiEndpoints.twitter());
  }
}
