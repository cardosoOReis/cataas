import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:dartz/dartz.dart';

class CatModel extends CatEntity {
  const CatModel({
    required super.id,
    required super.fileType,
    required super.requestedAt,
    required super.text,
    required super.textColor,
    required super.filter,
    required super.tags,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['_id'],
      fileType: (json['file'] as String).endsWith('gif')
          ? FileType.gif
          : FileType.image,
      requestedAt: DateTime.now(),
      text: json.containsKey('text') ? Some(json['text']) : const None(),
      textColor: json.containsKey('textColor')
          ? Some(json['textColor'])
          : const None(),
      filter: json.containsKey('filter') ? Some(json['filter']) : const None(),
      tags: (json['tags'] as List).isNotEmpty
          ? Some(json['tags'].cast<String>())
          : const None(),
    );
  }
}
