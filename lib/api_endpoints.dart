class ApiEndpoints {
  static String get baseUrl => 'https://cataas.com/cat';

  static String getCatById(String id) => '$baseUrl/$id';

  static String getCatByTag(String tag) => '$baseUrl/tag/$tag';
}
