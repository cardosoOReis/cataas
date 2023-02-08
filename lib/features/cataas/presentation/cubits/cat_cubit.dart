import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/cat_entity.dart';
import '../../domain/usecases/get_cat_by_id_usecase.dart';
import '../../domain/usecases/get_cat_by_tag_usecase.dart';
import '../../domain/usecases/get_random_cat_usecase.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final GetRandomCatUsecase getRandomCatUsecase;
  final GetCatByIdUsecase getCatByIdUsecase;
  final GetCatByTagUsecase getCatByTagUsecase;
  CatCubit({
    required this.getRandomCatUsecase,
    required this.getCatByIdUsecase,
    required this.getCatByTagUsecase,
  }) : super(const CatState());

  Future<void> onGetRandomCatButtonTap({
    String? text,
    String? textColor,
    String? filter,
  }) async {
    emit(state.copyWith(status: CatStatus.loading));
    final params = GetRandomCatUsecaseParams(
      text: text != null && text.isNotEmpty ? Some(text) : const None(),
      textColor: textColor != null && textColor.isNotEmpty
          ? Some(textColor)
          : const None(),
      filter: filter != null && filter.isNotEmpty ? Some(filter) : const None(),
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
}

extension ToOptionString on String? {
  Option<String> toOption() => this != null && this != ''
      ? Some(this!) // ignore: avoid-non-null-assertion
      : None();
}
