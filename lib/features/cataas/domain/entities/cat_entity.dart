import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String id;
  final FileType fileType;
  final DateTime requestedAt;
  final String url;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  final Option<List<String>> tags;
  const CatEntity({
    required this.id,
    required this.fileType,
    required this.requestedAt,
    required this.url,
    required this.text,
    required this.textColor,
    required this.filter,
    required this.tags,
  });

  @override
  List<Object?> get props => [
        id,
        fileType,
        requestedAt,
        url,
        text,
        textColor,
        filter,
        tags,
      ];
}

enum FileType {
  image,
  gif,
}
