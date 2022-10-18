import 'package:flutter/foundation.dart';

class CatEntity {
  String id;
  String type;
  String createdAt;
  String url;
  List<String>? tags;
  String? text;
  String? textColor;
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
}
