import 'package:dartz/dartz.dart';

import '../../domain/entities/cat.dart';
import '../api_endpoints.dart';

class CatModel extends Cat {
  const CatModel({
    required super.id,
    required super.fileType,
    required super.requestedAt,
    required super.url,
    required super.tags,
    super.text,
    super.textColor,
    super.filter,
  });

  factory CatModel.fromJson({
    required Map<String, dynamic> json,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  }) {
    final body = _CatModelFromRequest.fromJson(json);

    return CatModel(
      id: body.id,
      fileType: body.file.endsWith('gif') ? FileType.gif : FileType.image,
      requestedAt: DateTime.now(),
      url: body.url,
      text: text.toNullable(),
      textColor: textColor.toNullable(),
      filter: filter.toNullable(),
      tags: body.tags,
    );
  }
}

class _CatModelFromRequest {
  final List<String> tags;
  final String file;
  final String id;
  final String url;
  const _CatModelFromRequest({
    required this.tags,
    required this.file,
    required this.id,
    required this.url,
  });

  factory _CatModelFromRequest.fromJson(Map<String, dynamic> json) {
    return _CatModelFromRequest(
      tags: json['tags'].cast<String>(),
      file: json['file'],
      id: json['_id'],
      url: ApiEndpoints.baseUrl + json['url'],
    );
  }
}
