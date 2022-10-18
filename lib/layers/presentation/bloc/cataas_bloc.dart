import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/cat_entity.dart';
import '../controller/cat_controller.dart';

part 'cataas_event.dart';
part 'cataas_state.dart';

class CataasBloc extends Bloc<CataasEvent, CataasState> {
  static CatController controller = GetIt.instance<CatController>();

  CataasBloc() : super(CataasInitialState()) {
    CatEntity catEntity;
    on<GetCatbyIdEvent>((event, emit) async {
      try {
        catEntity = await controller.getCatById(event.id);
        emit(CataasSucessState(catEntity: catEntity));
      } on Exception catch (e) {
        emit(CataasErrorState(message: e.toString()));
      }
    });
    on<GetRandomCatEvent>((event, emit) async {
      try {
        catEntity = await controller.getRandomCat();
        emit(CataasSucessState(catEntity: catEntity));
      } on Exception catch (e) {
        emit(CataasErrorState(message: e.toString()));
      }
    });
    on<GetRandomCatWithParamsEvent>((event, emit) async {
      try {
        catEntity = await controller.getRandomCatWithParams(
          tag: event.tag,
          text: event.text,
          textColor: event.textColor,
          filter: event.filter,
        );
        emit(CataasSucessState(catEntity: catEntity));
      } catch (e) {
        emit(CataasErrorState(message: e.toString()));
      }
    });
  }
}
