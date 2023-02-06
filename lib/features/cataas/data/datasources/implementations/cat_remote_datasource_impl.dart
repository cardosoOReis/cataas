import 'dart:convert';

import 'package:dio/dio.dart';

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
    try {
      String url = 'https://cataas.com/cat/${params.id}';
      final Map<String, dynamic> queryParameters = {'json': 'true'};
      params.text.fold(
        () {},
        (text) => url += '/says/$text',
      );
      params.textColor.fold(
        () {},
        (textColor) => queryParameters.addAll({'textColor': textColor}),
      );
      params.filter.fold(
        () {},
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

  @override
  Future<CatModel> getCatByTag(GetCatByTagUsecaseParams params) async {
    try {
      String url = 'https://cataas.com/cat/tag/${params.tag}';
      final Map<String, dynamic> queryParameters = {'json': 'true'};
      params.text.fold(
        () {},
        (text) => url += '/says/$text',
      );
      params.textColor.fold(
        () {},
        (textColor) => queryParameters.addAll({'textColor': textColor}),
      );
      params.filter.fold(
        () {},
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

  @override
  Future<CatModel> getRandomCat(GetRandomCatUsecaseParams params) async {
    try {
      String url = 'https://cataas.com/cat';
      final Map<String, dynamic> queryParameters = {'json': 'true'};
      params.text.fold(
        () {},
        (text) => url += '/says/$text',
      );
      params.textColor.fold(
        () {},
        (textColor) => queryParameters.addAll({'textColor': textColor}),
      );
      params.filter.fold(
        () {},
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
