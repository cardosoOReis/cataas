import 'package:fpdart/fpdart.dart';

extension FoldOption<T> on Option<T> {
  void ifSome(void Function(T) isSome) => fold(() {}, isSome);
  void ifNone(void Function() isNone) => fold(isNone, (_) {});
}

extension FoldEither<L, R> on Either<L, R> {
  void ifOk(void Function(R) ifOk) => fold((_) {}, ifOk);
  void ifErr(void Function(L) ifErr) => fold(ifErr, (_) {});
}
