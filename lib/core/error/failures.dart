import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure();
  String get message;
}

class ApiFailure extends Failure {
  final ApiException exception;
  const ApiFailure({
    required this.exception,
  });

  @override
  String get message =>
      'Sorry, it looks like something went wrong when fetching your cat 😿';

  @override
  List<Object?> get props => [exception];
}

class ParseDataFailure extends Failure {
  final ParseDataException exception;
  const ParseDataFailure({
    required this.exception,
  });

  @override
  String get message =>
      'Sorry, it looks like something went wrong when fetching your cat 😿.';

  @override
  List<Object?> get props => [exception];
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure();

  @override
  String get message => """
Uh oh, it looks like you don't have internet connection 😿. Could you please try again later?""";

  @override
  List<Object?> get props => [];
}

class SaveCatLocallyFailure extends Failure {
  final SaveCatLocallyException exception;
  const SaveCatLocallyFailure({
    required this.exception,
  });

  @override
  String get message =>
      'Sorry, it looks like something went wrong when saving your cat 😿.';

  @override
  List<Object?> get props => [exception];
}

class ServerFailure extends Failure {
  final ServerException exception;
  const ServerFailure({
    required this.exception,
  });

  @override
  String get message => '''
Sorry, we are having some problems with our servers 🙀. Could you please try again later?''';

  @override
  List<Object?> get props => [exception];
}

class GeneralFailure extends Failure {
  final dynamic exception;
  const GeneralFailure({
    required this.exception,
  });

  @override
  String get message => '''
Uh oh, it appears something went wrong 🙀. 
Could you please try again later?''';

  @override
  List<Object?> get props => [exception];
}

class CouldntOpenUrlOnBrowserFailure extends Failure {
  const CouldntOpenUrlOnBrowserFailure();

  @override
  String get message =>
      "Uh oh, it appears we can't open this right now, sorry 😿. ";

  @override
  List<Object?> get props => [];
}

class ShareCatFailure extends Failure {
  const ShareCatFailure();

  @override
  String get message => '''
It appears that an error happened when we tried to share this cat. We are sorry 😿.''';

  @override
  List<Object?> get props => [];
}
