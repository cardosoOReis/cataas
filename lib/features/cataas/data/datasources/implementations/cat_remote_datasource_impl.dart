import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/services/share_image/i_share_image_service.dart';
import '../../../presentation/usecases/i_get_cat_by_id_or_tag_usecase.dart';
import '../../../presentation/usecases/i_get_cat_by_id_usecase.dart';
import '../../../presentation/usecases/i_get_cat_by_tag_usecase.dart';
import '../../../presentation/usecases/i_get_random_cat_usecase.dart';
import '../../../presentation/usecases/i_share_cat_usecase.dart';
import '../../models/cat_model.dart';
import '../api_endpoints.dart';
import '../i_cat_remote_datasource.dart';

class CatRemoteDatasourceImpl implements ICatRemoteDatasource {
  final Dio _client;
  final IShareImageService _shareImageService;
  const CatRemoteDatasourceImpl({
    required Dio client,
    required IShareImageService shareImageService,
  })  : _shareImageService = shareImageService,
        _client = client;

  @override
  Future<CatModel> getCatById(GetCatByIdUsecaseParams params) async => _getCat(
        ApiEndpoints.getCatById(params.id),
        params: _QueryParams(
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        ),
      );

  @override
  Future<CatModel> getCatByTag(GetCatByTagUsecaseParams params) async =>
      _getCat(
        ApiEndpoints.getCatByTag(params.tag),
        params: _QueryParams(
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        ),
      );

  @override
  Future<CatModel> getRandomCat(GetRandomCatUsecaseParams params) async =>
      _getCat(
        ApiEndpoints.getRandomCat(),
        params: _QueryParams(
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        ),
      );

  @override
  Future<CatModel> getCatByIdOrTag(GetCatByIdOrTagUsecaseParams params) async =>
      _getCat(
        ApiEndpoints.getCatByIdOrTag(params.value),
        params: _QueryParams(
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        ),
      );

  Future<CatModel> _getCat(
    String url, {
    required _QueryParams params,
  }) async {
    try {
      final sb = StringBuffer(url)
        ..write(params.text.map((t) => '/says/$t').toNullable());
      final queryParameters = <String, dynamic>{'json': 'true'}
        ..addAll(optionalToMap(params.textColor, 'textColor'))
        ..addAll(optionalToMap(params.filter, 'filter'));

      final response = await _client.get(
        sb.toString(),
        queryParameters: queryParameters,
      );
      try {
        final model = CatModel.fromJson(
          json: response.data,
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        );

        return model;
      } catch (_) {
        throw ParseDataException(body: response.data);
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 404) {
        throw const CatNotFoundException(statusCode: 404);
      }
      if (statusCode >= 500) {
        throw ServerException(message: e.message ?? '', statusCode: statusCode);
      }
      throw ApiException(
        message: e.message ?? '',
        statusCode: statusCode,
      );
    } catch (_) {
      rethrow;
    }
  }

  Map<String, dynamic> optionalToMap(Option<String> o, String key) =>
      o.map((t) => {key: t}).getOrElse(() => {});

  @override
  Future<void> shareCat(ShareCatUsecaseParams params) async {
    try {
      final result = await _shareImageService(url: params.url);

      return result;
    } catch (_) {
      rethrow;
    }
  }
}

class _QueryParams {
  Option<String> text;
  Option<String> textColor;
  Option<String> filter;
  _QueryParams({
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
