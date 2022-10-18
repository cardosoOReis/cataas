part of 'cataas_bloc.dart';

@immutable
abstract class CataasEvent {}

class GetCatbyIdEvent extends CataasEvent {
  final String id;

  GetCatbyIdEvent(this.id);
}

class GetRandomCatEvent extends CataasEvent {}

class GetRandomCatWithParamsEvent extends CataasEvent {
  final String? tag;
  final String? text;
  final String? textColor;
  final String? filter;

  GetRandomCatWithParamsEvent({
    this.tag,
    this.text,
    this.textColor,
    this.filter,
  });
}
