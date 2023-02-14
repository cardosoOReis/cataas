class ApiException implements Exception {
  final String message;
  final int statusCode;
  const ApiException({
    required this.message,
    required this.statusCode,
  });
}

class CatNotFoundException extends ApiException {
  const CatNotFoundException({
    required super.statusCode,
  }) : super(
          message:
              "Sorry, it appears we couldn't find your cat 😿. Could you please try again?",
        );
}

class ParseDataException implements Exception {
  final Map<dynamic, dynamic> body;
  const ParseDataException({
    required this.body,
  });
}

class ServerException implements Exception {
  final String message;
  final int statusCode;

  const ServerException({
    required this.message,
    required this.statusCode,
  });
}

class SaveCatLocallyException implements Exception {
  const SaveCatLocallyException();
}

class ShareCatException implements Exception {
  const ShareCatException();
}
