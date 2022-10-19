// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shell/layers/domain/repositories/get_tags_repository.dart';

import 'get_tags_usecase.dart';

class GetTagsUsecaseImp implements GetTagsUsecase {
  final GetTagsRepository _getTagsRepository;
  GetTagsUsecaseImp(
    this._getTagsRepository,
  );

  @override
  Future<List<String>> call() async {
    return await _getTagsRepository();
  }
}
