class CatNotFoundException implements Exception {
  final String message;
  final int code;
  const CatNotFoundException({
    required this.message,
    required this.code,
  });
}

class ParseDataException implements Exception {
  final Map<dynamic, dynamic> body;
  const ParseDataException({
    required this.body,
  });
}
