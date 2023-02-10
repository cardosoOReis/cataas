import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

extension FoldOption<T> on Option<T> {
  void ifSome(void Function(T) isSome) => this.fold(() => null, isSome);
  void ifNone(VoidCallback isNone) => this.fold(isNone, (_) => null);
}

extension ToOption<T> on T? {
  Option<T> toOption() => this != null && this != ''
      ? Some(this!) // ignore: avoid-non-null-assertion
      : None();
}

extension FoldEither<L, R> on Either<L, R> {
  void ifOk(void Function(R) ifOk) => this.fold((l) => null, ifOk);
  void ifErr(void Function(L) ifErr) => this.fold(ifErr, (r) => null);
}
