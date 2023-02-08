import '../../../../../core/services/i_save_image_locally_service.dart';
import '../../../domain/usecases/save_cat_locally_usecase.dart';
import '../i_cat_local_datasource.dart';

class CatLocalDatasourceImpl implements ICatLocalDatasource {
  final ISaveImageLocallyService _service;
  CatLocalDatasourceImpl({
    required ISaveImageLocallyService service,
  }) : _service = service;
  @override
  Future<void> saveCatLocally(SaveCatLocallyUsecaseParams params) async {
    try {
      final result = await _service.saveImage(url: params.url);

      return result;
    } catch (_) {
      rethrow;
    }
  }
}