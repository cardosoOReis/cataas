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
}
