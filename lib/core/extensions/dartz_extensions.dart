import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

extension FoldOption<T> on Option<T> {
  void foldSome(void Function(T) isSome) => this.fold(() => null, isSome);
  void foldNone(VoidCallback isNone) => this.fold(isNone, (_) => null);
}

extension ToOption<T> on T? {
  Option<T> toOption() => this != null && this != ''
      ? Some(this!) // ignore: avoid-non-null-assertion
      : None();
}
