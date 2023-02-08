import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../api_endpoints.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/get_cat_by_id_usecase.dart';
import '../../../domain/usecases/get_cat_by_tag_usecase.dart';
import '../../../domain/usecases/get_random_cat_usecase.dart';
import '../../models/cat_model.dart';
import '../i_cat_remote_datasource.dart';

class CatRemoteDatasourceImpl implements ICatRemoteDatasource {
  final Dio client;
  CatRemoteDatasourceImpl({
    required this.client,
  });

  @override
  Future<CatModel> getCatById(GetCatByIdUsecaseParams params) async {
    return await _getCat(
      ApiEndpoints.getCatById(params.id),
      params: _QueryParams(
        text: params.text,
        textColor: params.textColor,
        filter: params.filter,
      ),
    );
  }

  @override
  Future<CatModel> getCatByTag(GetCatByTagUsecaseParams params) async {
    return await _getCat(
      ApiEndpoints.getCatByTag(params.tag),
      params: _QueryParams(
        text: params.text,
        textColor: params.textColor,
        filter: params.filter,
      ),
    );
  }

  @override
  Future<CatModel> getRandomCat(GetRandomCatUsecaseParams params) async {
    return await _getCat(
      ApiEndpoints.baseUrl,
      params: _QueryParams(
        text: params.text,
        textColor: params.textColor,
        filter: params.filter,
      ),
    );
  }

  Future<CatModel> _getCat(
    String url, {
    required _QueryParams params,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = {'json': 'true'};
      params.text.fold(
        () => null,
        (text) => url += '/says/$text',
      );
      params.textColor.fold(
        () => null,
        (textColor) => queryParameters.addAll({'textColor': textColor}),
      );
      params.filter.fold(
        () => null,
        (filter) => queryParameters.addAll({'filter': filter}),
      );

      final response = await client.get(
        url,
        queryParameters: queryParameters,
      );
      try {
        final model = CatModel.fromJson(
          json: jsonDecode(response.data),
          text: params.text,
          textColor: params.textColor,
          filter: params.filter,
        );

        return model;
      } catch (_) {
        throw ParseDataException(body: jsonDecode(response.data));
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 404) {
        throw CatNotFoundException(message: e.message, statusCode: 404);
      }
      if (statusCode >= 500) {
        throw ServerException(message: e.message, statusCode: statusCode);
      }
      throw ApiException(
        message: e.message,
        statusCode: statusCode,
      );
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
