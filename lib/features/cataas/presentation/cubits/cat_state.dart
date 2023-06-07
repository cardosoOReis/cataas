part of 'cat_cubit.dart';

class CatState extends Equatable {
  final CatStatus status;
  final CatStatus savingCatStatus;
  final CatStatus shareCatStatus;
  final Cat? catEntity;
  final Failure? failure;
  const CatState({
    this.status = CatStatus.initial,
    this.savingCatStatus = CatStatus.initial,
    this.shareCatStatus = CatStatus.initial,
    this.catEntity,
    this.failure,
  });

  bool get isSaveCatButtonEnabled => status.isSuccess;

  @override
  List<Object?> get props => [
        status,
        catEntity,
        failure,
        savingCatStatus,
        shareCatStatus,
      ];

  CatState copyWith({
    CatStatus? status,
    CatStatus? savingCatStatus,
    CatStatus? shareCatStatus,
    Cat? catEntity,
    Failure? failure,
  }) {
    return CatState(
      status: status ?? this.status,
      savingCatStatus: savingCatStatus ?? this.savingCatStatus,
      shareCatStatus: shareCatStatus ?? this.shareCatStatus,
      catEntity: catEntity ?? this.catEntity,
      failure: failure ?? this.failure,
    );
  }
}

enum CatStatus { initial, loading, success, failure }

extension CatStatusX on CatStatus {
  bool get isInitial => this == CatStatus.initial;
  bool get isLoading => this == CatStatus.loading;
  bool get isSuccess => this == CatStatus.success;
  bool get isFailure => this == CatStatus.failure;
}