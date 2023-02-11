import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

extension FoldOption<T> on Option<T> {
  void ifSome(void Function(T) isSome) => fold(() {}, isSome);
  void ifNone(VoidCallback isNone) => fold(isNone, (_) {});
}

extension ToOption<T> on T? {
  Option<T> toOption() =>
      this != null && this != '' ? Some(this as T) : None<T>();
}

extension FoldEither<L, R> on Either<L, R> {
  void ifOk(void Function(R) ifOk) => fold((_) {}, ifOk);
  void ifErr(void Function(L) ifErr) => fold(ifErr, (_) {});
}
