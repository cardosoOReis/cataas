// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cataas_bloc.dart';

@immutable
abstract class CataasState {
  final CatEntity? catEntity;
  final String? message;

  const CataasState({this.catEntity, this.message});
}

class CataasInitialState extends CataasState {}

class CataasSucessState extends CataasState {
  const CataasSucessState({super.catEntity});
}

class CataasErrorState extends CataasState {
  const CataasErrorState({super.message});
}
