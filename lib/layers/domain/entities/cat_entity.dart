// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'cat_entity.g.dart';

@HiveType(typeId: 0)
class CatEntity extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String type;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  String url;
  @HiveField(4)
  List<String>? tags;
  @HiveField(5)
  String? text;
  @HiveField(6)
  String? textColor;
  @HiveField(7)
  String? filter;

  CatEntity({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.url,
    this.tags,
    this.text,
    this.textColor,
    this.filter,
  });

  @override
  bool operator ==(covariant CatEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.url == url &&
        listEquals(other.tags, tags) &&
        other.text == text &&
        other.textColor == textColor &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        createdAt.hashCode ^
        url.hashCode ^
        tags.hashCode ^
        text.hashCode ^
        textColor.hashCode ^
        filter.hashCode;
  }

  @override
  String toString() {
    return '''CatEntity {
  id: $id,
  type: $type,
  createdAt: $createdAt,
  url: $url,
  tags: $tags,
  text: $text,
  textColor: $textColor,
  filter: $filter
}''';
  }
}
