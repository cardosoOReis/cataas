import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {}

class ApiFailure extends Failure {
  final ApiException exception;
  ApiFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

class ParseDataFailure extends Failure {
  final ParseDataException exception;
  ParseDataFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SaveCatLocallyFailure extends Failure {
  final SaveCatLocallyException exception;
  SaveCatLocallyFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}
