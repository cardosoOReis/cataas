import '../../domain/usecases/save_cat_locally_usecase.dart';

abstract class ICatLocalDatasource {
  Future<void> saveCatLocally(SaveCatLocallyUsecaseParams params);
}