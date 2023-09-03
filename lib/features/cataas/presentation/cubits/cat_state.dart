part of 'cat_cubit.dart';

sealed class CatState extends Equatable {
  const CatState();
}

final class CatInitial extends CatState {
  const CatInitial();

  @override
  List<Object?> get props => [];
}

final class CatLoading extends CatState {
  const CatLoading();

  @override
  List<Object?> get props => [];
}

final class CatSuccess extends CatState {
  final Cat cat;

  const CatSuccess({required this.cat});

  @override
  List<Object?> get props => [cat];
}

final class CatFailure extends CatState {
  final Failure failure;

  const CatFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
