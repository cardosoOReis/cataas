import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final FileType fileType;
  final DateTime requestedAt;
  final String url;
  final List<String> tags;
  final String? text;
  final String? textColor;
  final String? filter;
  const Cat({
    required this.id,
    required this.fileType,
    required this.requestedAt,
    required this.url,
    required this.tags,
    this.text,
    this.textColor,
    this.filter,
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
