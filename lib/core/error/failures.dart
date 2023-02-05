import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ApiFailure extends Failure {
  final Exception exception;
  ApiFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

class ParseDataFailure extends Failure {
  final Exception exception;
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
