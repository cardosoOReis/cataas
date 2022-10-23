class EmptyStorageException implements Exception {
  String? message;
  EmptyStorageException(
    this.message,
  );
}
