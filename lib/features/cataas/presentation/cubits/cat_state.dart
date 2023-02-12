part of 'cat_cubit.dart';

class CatState extends Equatable {
  final CatStatus status;
  final CatStatus savingCatStatus;
  final CatStatus shareCatStatus;
  final bool isSearchingById;
  final CatEntity? catEntity;
  final Failure? failure;
  const CatState({
    this.status = CatStatus.initial,
    this.savingCatStatus = CatStatus.initial,
    this.shareCatStatus = CatStatus.initial,
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
        savingCatStatus,
        shareCatStatus,
      ];

  CatState copyWith({
    CatStatus? status,
    CatStatus? savingCatStatus,
    CatStatus? shareCatStatus,
    bool? isSearchingById,
    CatEntity? catEntity,
    Failure? failure,
  }) {
    return CatState(
      status: status ?? this.status,
      savingCatStatus: savingCatStatus ?? this.savingCatStatus,
      shareCatStatus: shareCatStatus ?? this.shareCatStatus,
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
