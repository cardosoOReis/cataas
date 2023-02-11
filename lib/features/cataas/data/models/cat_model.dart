import 'package:dartz/dartz.dart';

import '../../../../api_endpoints.dart';
import '../../domain/entities/cat_entity.dart';

class CatModel extends CatEntity {
  const CatModel({
    required super.id,
    required super.fileType,
    required super.requestedAt,
    required super.url,
    required super.text,
    required super.textColor,
    required super.filter,
    required super.tags,
  });

  factory CatModel.fromJson({
    required Map<String, dynamic> json,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  }) {
    final body = CatModelFromRequest.fromJson(json);

    return CatModel(
      id: body.id,
      fileType: body.file.endsWith('gif') ? FileType.gif : FileType.image,
      requestedAt: DateTime.now(),
      url: body.url,
      text: text,
      textColor: textColor,
      filter: filter,
      tags: body.tags.isNotEmpty ? Some(body.tags) : const None(),
    );
  }
}

class CatModelFromRequest {
  final List<String> tags;
  final String file;
  final String id;
  final String url;
  CatModelFromRequest({
    required this.tags,
    required this.file,
    required this.id,
    required this.url,
  });

  factory CatModelFromRequest.fromJson(Map<String, dynamic> json) {
    return CatModelFromRequest(
      tags: json['tags'].cast<String>(),
      file: json['file'],
      id: json['_id'],
      url: ApiEndpoints.baseUrl + json['url'],
    );
  }
}
