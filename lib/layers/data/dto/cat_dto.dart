import '../../domain/entities/cat_entity.dart';

class CatDto extends CatEntity {
  CatDto({
    required super.id,
    required super.type,
    required super.createdAt,
    required super.url,
    super.tags,
    super.text,
    super.textColor,
    super.filter,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'createdAt': createdAt,
      'tags': tags,
      'text': text,
      'textColor': textColor,
      'filter': filter,
    };
  }

  factory CatDto.fromJson(Map<String, dynamic> json) {
    return CatDto(
      id: json['_id'],
      type: json['mimetype'],
      createdAt: json['createdAt'],
      url: json['url'],
      tags: json['tags'].cast<String>(),
      text: json['text'],
      textColor: json['textColor'],
      filter: json['filter'],
    );
  }
}
