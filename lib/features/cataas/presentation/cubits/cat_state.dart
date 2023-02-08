part of 'cat_cubit.dart';

class CatState extends Equatable {
  final CatStatus status;
  final bool isSearchingById;
  final CatEntity? catEntity;
  final Failure? failure;
  const CatState({
    this.status = CatStatus.initial,
    this.isSearchingById = true,
    this.catEntity,
    this.failure,
  });

  bool get isSaveCatButtonEnabled => status.isSuccess;

  @override
  List<Object?> get props => [
        status,
        isSearchingById,
        catEntity,
        failure,
      ];

  CatState copyWith({
    CatStatus? status,
    bool? isSearchingById,
    CatEntity? catEntity,
    Failure? failure,
  }) {
    return CatState(
      status: status ?? this.status,
      isSearchingById: isSearchingById ?? this.isSearchingById,
      catEntity: catEntity ?? this.catEntity,
      failure: failure ?? this.failure,
    );
  }
}

extension CatStatusX on CatStatus {
  bool get isInitial => this == CatStatus.initial;
  bool get isLoading => this == CatStatus.loading;
  bool get isSuccess => this == CatStatus.success;
  bool get isFailure => this == CatStatus.failure;
}

enum CatStatus { initial, loading, success, failure }
