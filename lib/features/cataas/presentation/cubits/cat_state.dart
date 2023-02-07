part of 'cat_cubit.dart';

class CatState extends Equatable {
  final CatStatus status;
  final bool isSaveCatButtonEnabled;
  final bool isSearchingById;
  final CatEntity? catEntity;
  final Failure? failure;
  const CatState({
    this.status = CatStatus.initial,
    this.isSaveCatButtonEnabled = false,
    this.isSearchingById = true,
    this.catEntity,
    this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        isSaveCatButtonEnabled,
        isSearchingById,
        catEntity,
        failure,
      ];

  CatState copyWith({
    CatStatus? status,
    bool? isSaveCatButtonEnabled,
    bool? isSearchingById,
    CatEntity? catEntity,
    Failure? failure,
  }) {
    return CatState(
      status: status ?? this.status,
      isSaveCatButtonEnabled:
          isSaveCatButtonEnabled ?? this.isSaveCatButtonEnabled,
      isSearchingById: isSearchingById ?? this.isSearchingById,
      catEntity: catEntity ?? this.catEntity,
      failure: failure ?? this.failure,
    );
  }
}

extension CatStatusX on CatStatus {
  bool get isInitial => this == CatStatus.initial;
  bool get isLoading => this == CatStatus.loading;
  bool get isSucess => this == CatStatus.sucess;
  bool get isFailure => this == CatStatus.failure;
}

enum CatStatus { initial, loading, sucess, failure }
