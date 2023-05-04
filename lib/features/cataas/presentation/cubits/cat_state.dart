part of 'cat_cubit.dart';

class CatState extends Equatable {
  final CatStatus status;
  final CatStatus savingCatStatus;
  final CatStatus shareCatStatus;
  final SearchType searchType;
  final Cat? catEntity;
  final Failure? failure;
  const CatState({
    this.status = CatStatus.initial,
    this.savingCatStatus = CatStatus.initial,
    this.shareCatStatus = CatStatus.initial,
    this.searchType = SearchType.id,
    this.catEntity,
    this.failure,
  });

  bool get isSaveCatButtonEnabled => status.isSuccess;

  @override
  List<Object?> get props => [
        status,
        searchType,
        catEntity,
        failure,
        savingCatStatus,
        shareCatStatus,
      ];

  CatState copyWith({
    CatStatus? status,
    CatStatus? savingCatStatus,
    CatStatus? shareCatStatus,
    SearchType? searchType,
    Cat? catEntity,
    Failure? failure,
  }) {
    return CatState(
      status: status ?? this.status,
      savingCatStatus: savingCatStatus ?? this.savingCatStatus,
      shareCatStatus: shareCatStatus ?? this.shareCatStatus,
      searchType: searchType ?? this.searchType,
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

enum SearchType { id, tag }

extension SearchTypeX on SearchType {
  bool get isId => this == SearchType.id;
  bool get isTag => this == SearchType.tag;
}

extension SearchTypeStrings on SearchType {
  String get label {
    switch (this) {
      case SearchType.id:
        return 'ID';
      case SearchType.tag:
        return 'Tag';
    }
  }

  String get hintText {
    switch (this) {
      case SearchType.id:
        return "Get a cat based on it's id.";
      case SearchType.tag:
        return "Get a cat based on a tag.";
    }
  }

  String get buttonTitle {
    switch (this) {
      case SearchType.id:
        return "Get a Cat by it's Id";
      case SearchType.tag:
        return "Get a Cat by it's Tag";
    }
  }
}
