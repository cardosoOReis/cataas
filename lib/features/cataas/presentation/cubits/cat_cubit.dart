import 'package:bloc/bloc.dart';
import 'package:cataas/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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
      text: text != null && text != '' ? Some(text) : const None(),
      textColor:
          textColor != null && textColor != '' ? Some(textColor) : const None(),
      filter: filter != null && filter != '' ? Some(filter) : const None(),
    );
    final result = await getRandomCatUsecase(params);
    result.fold(
      (failure) {},
      (catEntity) {
        emit(
          state.copyWith(
            status: CatStatus.sucess,
            catEntity: catEntity,
            isSaveCatButtonEnabled: true,
          ),
        );
      },
    );
  }

  Future<void> onGetCatBySpecificButtonTap(
    String specific, {
    String? text,
    String? textColor,
    String? filter,
  }) async {}
}
