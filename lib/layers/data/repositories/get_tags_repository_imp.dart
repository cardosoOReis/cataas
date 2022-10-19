import '../../domain/repositories/get_tags_repository.dart';
import '../datasources/get_tags_datasource.dart';

class GetTagsRepositoryImp implements GetTagsRepository {
  final GetTagsDatasource _getTagsDatasource;
  GetTagsRepositoryImp(this._getTagsDatasource);

  @override
  Future<List<String>> call() async {
    return await _getTagsDatasource();
  }
}
